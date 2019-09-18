#include "staticfunctions.h"
#include "meshsimplify.h"
#include "simplify.h"

MeshSimplify::MeshSimplify()
{
  vcolor=0;

  QStringList ps;
  ps << "x";
  ps << "y";
  ps << "z";
  ps << "nx";
  ps << "ny";
  ps << "nz";
  ps << "red";
  ps << "green";
  ps << "blue";
  ps << "vertex_indices";
  ps << "vertex";
  ps << "face";

  for(int i=0; i<ps.count(); i++)
    {
      char *s;
      s = new char[ps[i].size()+1];
      strcpy(s, ps[i].toLatin1().data());
      plyStrings << s;
    }
}
MeshSimplify::~MeshSimplify() {if (vcolor) delete [] vcolor;}

bool
MeshSimplify::getValues(float &decimate, int &aggressive)
{
  decimate = 0.2;
  aggressive = 2;
  
  PropertyEditor propertyEditor;
  QMap<QString, QVariantList> plist;
  
  QVariantList vlist;

  vlist.clear();
  vlist << QVariant("float");
  vlist << QVariant(decimate);
  vlist << QVariant(0.1);
  vlist << QVariant(0.9);
  vlist << QVariant(0.1); // singlestep
  vlist << QVariant(1); // decimals
  plist["decimate"] = vlist;

  vlist.clear();
  vlist << QVariant("int");
  vlist << QVariant(aggressive);
  vlist << QVariant(1);
  vlist << QVariant(10);
  plist["aggressive"] = vlist;

  vlist.clear();
  QFile helpFile(":/meshsimplify.help");
  if (helpFile.open(QFile::ReadOnly))
    {
      QTextStream in(&helpFile);
      QString line = in.readLine();
      while (!line.isNull())
	{
	  if (line == "#begin")
	    {
	      QString keyword = in.readLine();
	      QString helptext;
	      line = in.readLine();
	      while (!line.isNull())
		{
		  helptext += line;
		  helptext += "\n";
		  line = in.readLine();
		  if (line == "#end") break;
		}
	      vlist << keyword << helptext;
	    }
	  line = in.readLine();
	}
    }	      
  plist["commandhelp"] = vlist;

  vlist.clear();
  QString mesg;
  mesg += "\n* You can keep on working while this process is running.\n";
  vlist << mesg;
  plist["message"] = vlist;


  QStringList keys;
  keys << "decimate";
  keys << "aggressive";
  keys << "commandhelp";
  keys << "message";

  propertyEditor.set("Mesh Simplify Parameters", plist, keys);
  QMap<QString, QPair<QVariant, bool> > vmap;
  
  if (propertyEditor.exec() == QDialog::Accepted)
    vmap = propertyEditor.get();
  else
    return false;
  
  for(int ik=0; ik<keys.count(); ik++)
    {
      QPair<QVariant, bool> pair = vmap.value(keys[ik]);

      if (pair.second)
	{
	  if (keys[ik] == "decimate")
	    decimate = pair.first.toFloat();
	  else if (keys[ik] == "aggressive")
	    aggressive = pair.first.toInt();
	}
    }

  return true;
}


QString
MeshSimplify::start(QString prevDir)
{
  //---- import the mesh ---
  QString inflnm = QFileDialog::getOpenFileName(0,
						"Load mesh to simplify",
						prevDir,
						"*.ply");
  if (inflnm.size() == 0)
    {
      //meshWindow->close();
      return "";
    }

  if (!loadPLY(inflnm))
    {
      //meshWindow->close();
      return "";
    }
  //----------------------------

  //---- export the mesh ---
  QString outflnm = QFileDialog::getSaveFileName(0,
						 "Export mesh",
						 prevDir,
						 "*.ply");
  if (outflnm.size() == 0)
    {
      //meshWindow->close();
      return "";
    }
  if (!StaticFunctions::checkExtension(outflnm, ".ply"))
    outflnm += ".ply";
  //----------------------------


  float decimate;
  int aggressive;

  if (! getValues(decimate, aggressive))
    return "";


  m_meshLog = new QTextEdit;
  m_meshProgress = new QProgressBar;

  QVBoxLayout *meshLayout = new QVBoxLayout;
  meshLayout->addWidget(m_meshLog);
  meshLayout->addWidget(m_meshProgress);

  QWidget *meshWindow = new QWidget;
  meshWindow->setWindowTitle("Drishti - Mesh Simplification");
  meshWindow->setLayout(meshLayout);
  meshWindow->show();
  meshWindow->resize(700, 700);

  m_meshLog->insertPlainText("\n\n");
  m_meshLog->insertPlainText(QString("Decimation : %1\n").arg(decimate));
  m_meshLog->insertPlainText(QString("Aggressive : %1\n").arg(aggressive));
  
  simplifyMesh(inflnm, outflnm, decimate, aggressive);


  meshWindow->close();

  return outflnm;
}


void
MeshSimplify::simplifyMesh(QString inflnm,
			   QString outflnm,
			   float decimate, int aggressive)
{
  QString mesg;

  m_meshLog->moveCursor(QTextCursor::End);
  m_meshLog->insertPlainText(" Simplifying ...\n");

  Simplify::load_ply(m_nverts, m_nfaces, m_vlist, m_flist);

  //Simplify::load_obj(inflnm.toLatin1().data());
  int target_count =  Simplify::triangles.size() * decimate;
  int startSize = Simplify::triangles.size();
  
  mesg = QString("Input : %1 vertices,  %2 triangles (target %3)\n").	\
    arg(Simplify::vertices.size()).\
    arg(Simplify::triangles.size()).\
    arg(target_count);
	
  m_meshLog->moveCursor(QTextCursor::End);
  m_meshLog->insertPlainText(mesg);
  qApp->processEvents();


  Simplify::simplify_mesh(m_meshLog,
			  target_count,
			  aggressive,
			  true);

  //Simplify::write_obj(outflnm.toLatin1().data());
  
  mesg = QString("Output : %1 vertices,  %2 triangles (reduction %3)\n").\
    arg(Simplify::vertices.size()).\
    arg(Simplify::triangles.size()).\
    arg((float)Simplify::triangles.size()/(float)startSize);
  m_meshLog->moveCursor(QTextCursor::End);
  m_meshLog->insertPlainText(mesg);
  qApp->processEvents();

//  for(int ni=0; ni<m_nverts; ni++)
//    {
//      m_meshProgress->setValue((int)(100.0*(float)ni/(float)m_nverts));
//      qApp->processEvents();
//    }
//  m_meshProgress->setValue(100);

  //-----
  m_nverts = Simplify::vertices.size();
  m_nfaces = Simplify::triangles.size();
  for(int i=0; i<m_nverts; i++)
    {
      m_vlist[i]->x = Simplify::vertices[i].p.x;
      m_vlist[i]->y = Simplify::vertices[i].p.y;
      m_vlist[i]->z = Simplify::vertices[i].p.z;
      m_vlist[i]->nx = Simplify::vertices[i].n.x;
      m_vlist[i]->ny = Simplify::vertices[i].n.y;
      m_vlist[i]->nz = Simplify::vertices[i].n.z;
      m_vlist[i]->r = Simplify::vertices[i].c.x;
      m_vlist[i]->g = Simplify::vertices[i].c.y;
      m_vlist[i]->b = Simplify::vertices[i].c.z;
    }
  for(int i=0; i<m_nfaces; i++)
    {
      m_flist[i]->nverts = 3;
      m_flist[i]->verts[0] = Simplify::triangles[i].v[0];
      m_flist[i]->verts[1] = Simplify::triangles[i].v[1];
      m_flist[i]->verts[2] = Simplify::triangles[i].v[2];
    }
  //-----

  
  savePLY(outflnm);

  m_meshLog->moveCursor(QTextCursor::End);
  m_meshLog->insertPlainText("Mesh saved in "+outflnm);

  QMessageBox::information(0, "", QString("Mesh saved in "+outflnm));
}

void
MeshSimplify::savePLY(QString flnm)
{
  m_meshLog->moveCursor(QTextCursor::End);
  m_meshLog->insertPlainText("Saving Mesh");

  PlyProperty vert_props[] = { /* list of property information for a vertex */
    {plyStrings[0], Float32, Float32, offsetof(PlyVertex,x), 0, 0, 0, 0},
    {plyStrings[1], Float32, Float32, offsetof(PlyVertex,y), 0, 0, 0, 0},
    {plyStrings[2], Float32, Float32, offsetof(PlyVertex,z), 0, 0, 0, 0},
    {plyStrings[3], Float32, Float32, offsetof(PlyVertex,nx), 0, 0, 0, 0},
    {plyStrings[4], Float32, Float32, offsetof(PlyVertex,ny), 0, 0, 0, 0},
    {plyStrings[5], Float32, Float32, offsetof(PlyVertex,nz), 0, 0, 0, 0},
    {plyStrings[6], Uint8, Uint8, offsetof(PlyVertex,r), 0, 0, 0, 0},
    {plyStrings[7], Uint8, Uint8, offsetof(PlyVertex,g), 0, 0, 0, 0},
    {plyStrings[8], Uint8, Uint8, offsetof(PlyVertex,b), 0, 0, 0, 0},
  };

  PlyProperty face_props[] = { /* list of property information for a face */
    {plyStrings[9], Int32, Int32, offsetof(PlyFace,verts),
     1, Uint8, Uint8, offsetof(PlyFace,nverts)},
  };


  PlyFile *ply;
  FILE *fp = fopen(flnm.toLatin1().data(), "wb");

  PlyFace face ;
  int verts[3] ;
  char *elem_names[]  = {plyStrings[10], plyStrings[11]};
  ply = write_ply (fp,
		   2,
		   elem_names,
		   PLY_BINARY_LE );

  /* describe what properties go into the PlyVertex elements */
  describe_element_ply ( ply, plyStrings[10], m_nverts );
  describe_property_ply ( ply, &vert_props[0] );
  describe_property_ply ( ply, &vert_props[1] );
  describe_property_ply ( ply, &vert_props[2] );
  describe_property_ply ( ply, &vert_props[3] );
  describe_property_ply ( ply, &vert_props[4] );
  describe_property_ply ( ply, &vert_props[5] );
  describe_property_ply ( ply, &vert_props[6] );
  describe_property_ply ( ply, &vert_props[7] );
  describe_property_ply ( ply, &vert_props[8] );

  /* describe PlyFace properties (just list of PlyVertex indices) */
  describe_element_ply ( ply, plyStrings[11], m_nfaces );
  describe_property_ply ( ply, &face_props[0] );

  header_complete_ply ( ply );

  /* set up and write the PlyVertex elements */
  put_element_setup_ply ( ply, plyStrings[10] );
  for(int ni=0; ni<m_nverts; ni++)
    put_element_ply ( ply, ( void * ) m_vlist[ni] );

  /* set up and write the PlyFace elements */
  put_element_setup_ply ( ply, plyStrings[11] );
  for(int ni=0; ni<m_nfaces; ni++)
    put_element_ply ( ply, ( void * ) m_flist[ni] );

  close_ply ( ply );
  free_ply ( ply );

  m_meshProgress->setValue(100);
}

bool
MeshSimplify::loadPLY(QString flnm)
{
  PlyProperty vert_props[] = { /* list of property information for a vertex */
    {plyStrings[0], Float32, Float32, offsetof(PlyVertex,x), 0, 0, 0, 0},
    {plyStrings[1], Float32, Float32, offsetof(PlyVertex,y), 0, 0, 0, 0},
    {plyStrings[2], Float32, Float32, offsetof(PlyVertex,z), 0, 0, 0, 0},
    {plyStrings[3], Float32, Float32, offsetof(PlyVertex,nx), 0, 0, 0, 0},
    {plyStrings[4], Float32, Float32, offsetof(PlyVertex,ny), 0, 0, 0, 0},
    {plyStrings[5], Float32, Float32, offsetof(PlyVertex,nz), 0, 0, 0, 0},
    {plyStrings[6], Uint8, Uint8, offsetof(PlyVertex,r), 0, 0, 0, 0},
    {plyStrings[7], Uint8, Uint8, offsetof(PlyVertex,g), 0, 0, 0, 0},
    {plyStrings[8], Uint8, Uint8, offsetof(PlyVertex,b), 0, 0, 0, 0},
  };

  PlyProperty face_props[] = { /* list of property information for a face */
    {plyStrings[9], Int32, Int32, offsetof(PlyFace,verts),
     1, Uint8, Uint8, offsetof(PlyFace,nverts)},
  };


  /*** the PLY object ***/
  PlyOtherProp *vert_other,*face_other;

  bool per_vertex_color = false;
  bool has_normals = false;

  int i,j;
  int elem_count;
  char *elem_name;
  PlyFile *in_ply;


  /*** Read in the original PLY object ***/
  FILE *fp = fopen(flnm.toLatin1().data(), "rb");

  in_ply  = read_ply (fp);

  for (i = 0; i < in_ply->num_elem_types; i++) {

    /* prepare to read the i'th list of elements */
    elem_name = setup_element_read_ply (in_ply, i, &elem_count);


    if (QString("vertex") == QString(elem_name)) {

      /* create a vertex list to hold all the vertices */
      m_vlist = (PlyVertex **) malloc (sizeof (PlyVertex *) * elem_count);
      m_nverts = elem_count;

      /* set up for getting vertex elements */

      setup_property_ply (in_ply, &vert_props[0]);
      setup_property_ply (in_ply, &vert_props[1]);
      setup_property_ply (in_ply, &vert_props[2]);

      for (j = 0; j < in_ply->elems[i]->nprops; j++) {
	PlyProperty *prop;
	prop = in_ply->elems[i]->props[j];
	if (QString("r") == QString(prop->name) ||
	    QString("red") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[3]);
	  per_vertex_color = true;
	}
	if (QString("g") == QString(prop->name) ||
	    QString("green") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[4]);
	  per_vertex_color = true;
	}
	if (QString("b") == QString(prop->name) ||
	    QString("blue") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[5]);
	  per_vertex_color = true;
	}
	if (QString("nx") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[6]);
	  has_normals = true;
	}
	if (QString("ny") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[7]);
	  has_normals = true;
	}
	if (QString("nz") == QString(prop->name)) {
	  setup_property_ply (in_ply, &vert_props[8]);
	  has_normals = true;
	}
      }

      /* grab all the vertex elements */
      for (j = 0; j < elem_count; j++) {
        m_vlist[j] = (PlyVertex *) malloc (sizeof (PlyVertex));
        get_element_ply (in_ply, (void *) m_vlist[j]);
      }
    }
    else if (QString("face") == QString(elem_name)) {

      /* create a list to hold all the face elements */
      m_flist = (PlyFace **) malloc (sizeof (PlyFace *) * elem_count);
      m_nfaces = elem_count;

      /* set up for getting face elements */

      setup_property_ply (in_ply, &face_props[0]);

      /* grab all the face elements */
      for (j = 0; j < elem_count; j++) {
        m_flist[j] = (PlyFace *) malloc (sizeof (PlyFace));
        get_element_ply (in_ply, (void *) m_flist[j]);
      }
    }
    else
      get_other_element_ply (in_ply);
  }

  close_ply (in_ply);
  free_ply (in_ply);
  

  vcolor = new float[m_nverts*3];
  for(int i=0; i<m_nverts; i++)
    {
      vcolor[3*i+0] = m_vlist[i]->r/255.0f;
      vcolor[3*i+1] = m_vlist[i]->g/255.0f;
      vcolor[3*i+2] = m_vlist[i]->b/255.0f;
    }

  QMessageBox::information(0, "", QString("Loaded input mesh : vertices %1  faces %2").\
			   arg(m_nverts).\
			   arg(m_nfaces));

  return true;
}
