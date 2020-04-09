TEMPLATE = lib

DRISHTI_DEFINES = RENDERER ITK
include( ../../../../drishti.pri )

QT += opengl xml network

CONFIG += release plugin

TARGET = connectedcomponentplugin

FORMS += ../../../propertyeditor.ui

win32 {
DESTDIR = ../../../../bin/renderplugins/ITK

INCLUDEPATH += ../../../ \
	$$InsightToolkit\Modules\Segmentation\Watersheds\include \
	$$InsightToolkit\Modules\Video\IO\include \
	$$InsightToolkit\Modules\Video\Filtering\include \
	$$InsightToolkit\Modules\Video\Core\include \
	$$InsightToolkit\Modules\Bridge\VTK\include \
	$$InsightToolkit\Modules\Core\TestKernel\include \
	$$InsightToolkit\Modules\Segmentation\SuperPixel\include \
	$$InsightToolkit\Modules\Filtering\SpatialFunction\include \
	$$InsightToolkit\Modules\Registration\RegistrationMethodsv4\include \
	$$InsightToolkit\Modules\Segmentation\RegionGrowing\include \
	$$InsightToolkit\Modules\Filtering\QuadEdgeMeshFiltering\include \
	$$InsightToolkit\Modules\Registration\Metricsv4\include \
	$$InsightToolkit\Modules\Numerics\Optimizersv4\include \
	$$InsightToolkit\Modules\Segmentation\MarkovRandomFieldsClassifiers\include \
	$$InsightToolkit\Modules\Segmentation\LevelSetsv4\include \
	$$InsightToolkit\Modules\Segmentation\LabelVoting\include \
	$$InsightToolkit\Modules\ThirdParty\libLBFGS\include \
	$$InsightToolkit\Modules\Segmentation\KLMRegionGrowing\include \
	$$InsightToolkit\Modules\Filtering\ImageNoise\include \
	$$InsightToolkit\Modules\Filtering\ImageFusion\include \
	$$InsightToolkit\Modules\Filtering\ImageFrequency\include \
	$$InsightToolkit\Modules\IO\VTK\include \
	$$InsightToolkit\Modules\IO\TransformMatlab\include \
	$$InsightToolkit\Modules\IO\TransformInsightLegacy\include \
	$$InsightToolkit\Modules\IO\TransformHDF5\include \
	$$InsightToolkit\Modules\IO\TransformBase\include \
	$$InsightToolkit\Modules\IO\TransformFactory\include \
	$$InsightToolkit\Modules\IO\Stimulate\include \
	$$InsightToolkit\Modules\IO\SpatialObjects\include \
	$$InsightToolkit\Modules\IO\XML\include \
	$$InsightToolkit\Modules\IO\Siemens\include \
	$$InsightToolkit\Modules\IO\RAW\include \
	$$InsightToolkit\Modules\IO\PNG\include \
	$$InsightToolkit\Modules\ThirdParty\PNG\src \
	$$ITK\Modules\ThirdParty\PNG\src \
	$$InsightToolkit\Modules\IO\NRRD\include \
	$$InsightToolkit\Modules\ThirdParty\NrrdIO\src\NrrdIO \
	$$ITK\Modules\ThirdParty\NrrdIO\src\NrrdIO \
	$$InsightToolkit\Modules\IO\NIFTI\include \
	$$InsightToolkit\Modules\IO\Meta\include \
	$$InsightToolkit\Modules\IO\Mesh\include \
	$$InsightToolkit\Modules\IO\MeshVTK\include \
	$$InsightToolkit\Modules\IO\MeshOFF\include \
	$$InsightToolkit\Modules\IO\MeshOBJ\include \
	$$InsightToolkit\Modules\IO\MeshGifti\include \
	$$InsightToolkit\Modules\IO\MeshFreeSurfer\include \
	$$InsightToolkit\Modules\IO\MeshBYU\include \
	$$InsightToolkit\Modules\IO\MeshBase\include \
	$$InsightToolkit\Modules\Segmentation\Voronoi\include \
	$$InsightToolkit\Modules\IO\MRC\include \
	$$InsightToolkit\Modules\IO\MINC\include \
	$$InsightToolkit\Modules\ThirdParty\HDF5\src\itkhdf5\src \
	$$ITK\Modules\ThirdParty\HDF5\src\itkhdf5 \
	$$InsightToolkit\Modules\ThirdParty\HDF5\src\itkhdf5 \
	$$InsightToolkit\Modules\ThirdParty\MINC\src\libminc\volume_io\Include \
	$$InsightToolkit\Modules\ThirdParty\MINC\src\libminc\libsrc2 \
	$$InsightToolkit\Modules\ThirdParty\MINC\src\libminc\libcommon \
	$$InsightToolkit\Modules\ThirdParty\MINC\src\libminc \
	$$InsightToolkit\Modules\ThirdParty\MINC \
	$$ITK\Modules\ThirdParty\MINC \
	$$InsightToolkit\Modules\IO\LSM\include \
	$$InsightToolkit\Modules\IO\TIFF\include \
	$$InsightToolkit\Modules\ThirdParty\TIFF\src \
	$$ITK\Modules\ThirdParty\TIFF\src\itktiff \
	$$ITK\Modules\ThirdParty\TIFF\src \
	$$InsightToolkit\Modules\IO\JPEG2000\include \
	$$InsightToolkit\Modules\ThirdParty\OpenJPEG\src\openjpeg \
	$$ITK\Modules\ThirdParty\OpenJPEG\src\openjpeg \
	$$InsightToolkit\Modules\IO\JPEG\include \
	$$InsightToolkit\Modules\ThirdParty\JPEG\src \
	$$ITK\Modules\ThirdParty\JPEG\src \
	$$InsightToolkit\Modules\IO\HDF5\include \
	$$InsightToolkit\Modules\IO\GIPL\include \
	$$InsightToolkit\Modules\IO\GE\include \
	$$InsightToolkit\Modules\IO\IPL\include \
	$$InsightToolkit\Modules\IO\GDCM\include \
	$$InsightToolkit\Modules\IO\CSV\include \
	$$InsightToolkit\Modules\IO\Bruker\include \
	$$InsightToolkit\Modules\IO\BioRad\include \
	$$InsightToolkit\Modules\IO\BMP\include \
	$$ITK\Modules\ThirdParty\HDF5\src \
	$$InsightToolkit\Modules\ThirdParty\HDF5\src \
	$$InsightToolkit\Modules\Filtering\GPUThresholding\include \
	$$InsightToolkit\Modules\Filtering\GPUSmoothing\include \
	$$InsightToolkit\Modules\Registration\GPUPDEDeformable\include \
	$$InsightToolkit\Modules\Registration\PDEDeformable\include \
	$$InsightToolkit\Modules\Registration\Common\include \
	$$InsightToolkit\Modules\Registration\GPUCommon\include \
	$$InsightToolkit\Modules\Filtering\GPUImageFilterBase\include \
	$$InsightToolkit\Modules\Filtering\GPUAnisotropicSmoothing\include \
	$$InsightToolkit\Modules\Core\GPUFiniteDifference\include \
	$$InsightToolkit\Modules\Core\GPUCommon\include \
	$$InsightToolkit\Modules\ThirdParty\GIFTI\src\gifticlib \
	$$InsightToolkit\Modules\ThirdParty\NIFTI\src\nifti\znzlib \
	$$InsightToolkit\Modules\ThirdParty\NIFTI\src\nifti\niftilib \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\DataStructureAndEncodingDefinition \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\MessageExchangeDefinition \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\InformationObjectDefinition \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\Common \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\DataDictionary \
	$$InsightToolkit\Modules\ThirdParty\GDCM\src\gdcm\Source\MediaStorageAndFileFormat \
	$$ITK\Modules\ThirdParty\GDCM\src\gdcm\Source\Common \
	$$ITK\Modules\ThirdParty\GDCM \
	$$InsightToolkit\Modules\ThirdParty\Expat\src\expat \
	$$ITK\Modules\ThirdParty\Expat\src\expat \
	$$InsightToolkit\Modules\Numerics\Eigen\include \
	$$InsightToolkit\Modules\Filtering\DisplacementField\include \
	$$InsightToolkit\Modules\Filtering\DiffusionTensorImage\include \
	$$InsightToolkit\Modules\Filtering\Denoising\include \
	$$InsightToolkit\Modules\Segmentation\DeformableMesh\include \
	$$InsightToolkit\Modules\Filtering\Deconvolution\include \
	$$InsightToolkit\Modules\ThirdParty\DICOMParser\src\DICOMParser \
	$$ITK\Modules\ThirdParty\DICOMParser\src\DICOMParser \
	$$InsightToolkit\Modules\Filtering\Convolution\include \
	$$InsightToolkit\Modules\Filtering\FFT\include \
	$$InsightToolkit\Modules\Filtering\Colormap\include \
	$$InsightToolkit\Modules\Segmentation\Classifiers\include \
	$$InsightToolkit\Modules\Filtering\BiasCorrection\include \
	$$InsightToolkit\Modules\Numerics\Polynomials\include \
	$$InsightToolkit\Modules\Filtering\AntiAlias\include \
	$$InsightToolkit\Modules\Segmentation\LevelSets\include \
	$$InsightToolkit\Modules\Segmentation\SignedDistanceFunction\include \
	$$InsightToolkit\Modules\Numerics\Optimizers\include \
	$$InsightToolkit\Modules\Filtering\ImageFeature\include \
	$$InsightToolkit\Modules\Filtering\ImageSources\include \
	$$InsightToolkit\Modules\Filtering\ImageGradient\include \
	$$InsightToolkit\Modules\Filtering\Smoothing\include \
	$$InsightToolkit\Modules\Filtering\ImageCompare\include \
	$$InsightToolkit\Modules\IO\ImageBase\include \
	$$ITK\Modules\IO\ImageBase \
	$$InsightToolkit\Modules\Filtering\FastMarching\include \
	$$InsightToolkit\Modules\Core\QuadEdgeMesh\include \
	$$InsightToolkit\Modules\Filtering\DistanceMap\include \
	$$InsightToolkit\Modules\Numerics\NarrowBand\include \
	$$InsightToolkit\Modules\Filtering\BinaryMathematicalMorphology\include \
	$$InsightToolkit\Modules\Filtering\MathematicalMorphology\include \
	$$InsightToolkit\Modules\Segmentation\ConnectedComponents\include \
	$$InsightToolkit\Modules\Filtering\Thresholding\include \
	$$InsightToolkit\Modules\Filtering\LabelMap\include \
	$$InsightToolkit\Modules\Filtering\ImageLabel\include \
	$$InsightToolkit\Modules\Filtering\ImageIntensity\include \
	$$InsightToolkit\Modules\Filtering\Path\include \
	$$InsightToolkit\Modules\Filtering\ImageStatistics\include \
	$$InsightToolkit\Modules\Core\SpatialObjects\include \
	$$InsightToolkit\Modules\ThirdParty\MetaIO\src\MetaIO\src \
	$$ITK\Modules\ThirdParty\MetaIO\src\MetaIO\src \
	$$InsightToolkit\Modules\ThirdParty\ZLIB\src \
	$$ITK\Modules\ThirdParty\ZLIB\src \
	$$InsightToolkit\Modules\Core\Mesh\include \
	$$InsightToolkit\Modules\Filtering\ImageCompose\include \
	$$InsightToolkit\Modules\Filtering\AnisotropicSmoothing\include \
	$$InsightToolkit\Modules\Filtering\ImageGrid\include \
	$$InsightToolkit\Modules\Core\ImageFunction\include \
	$$InsightToolkit\Modules\Core\Transform\include \
	$$InsightToolkit\Modules\Numerics\Statistics\include \
	$$ITK\Modules\ThirdParty\Netlib \
	$$InsightToolkit\Modules\Core\ImageAdaptors\include \
	$$InsightToolkit\Modules\Filtering\CurvatureFlow\include \
	$$InsightToolkit\Modules\Filtering\ImageFilterBase\include \
	$$InsightToolkit\Modules\Core\FiniteDifference\include \
	$$InsightToolkit\Modules\Core\Common\include \
	$$ITK\Modules\Core\Common \
	$$ITK\Modules\ThirdParty\VNL\src\vxl\core \
	$$ITK\Modules\ThirdParty\VNL\src\vxl\vcl \
	$$ITK\Modules\ThirdParty\VNL\src\vxl\v3p\netlib \
	$$InsightToolkit\Modules\ThirdParty\VNL\src\vxl\core \
	$$InsightToolkit\Modules\ThirdParty\VNL\src\vxl\vcl \
	$$InsightToolkit\Modules\ThirdParty\VNL\src\vxl\v3p\netlib \
	$$ITK\Modules\ThirdParty\KWSys\src \
	$$InsightToolkit\Modules\ThirdParty\KWIML\src \
	$$ITK\Modules\ThirdParty\KWIML\src \
	$$InsightToolkit\Modules\ThirdParty\Eigen3\src \
	$$ITK\Modules\ThirdParty\Eigen3\src \
	$$ITK\Modules\ThirdParty\DoubleConversion\src\double-conversion \
	$$InsightToolkit\Modules\ThirdParty\DoubleConversion\src \
	$$InsightToolkit\Modules\ThirdParty\VNL\src\vxl\core\vnl\algo \
	$$InsightToolkit\Modules\ThirdParty\VNL\src\vxl\core\vnl \
	$$ITK\Modules\ThirdParty\NIFTI\src\nifti\znzlib \
	$$ITK\Modules\ThirdParty\NIFTI\src\nifti\niftilib \
	$$ITK\Modules\ThirdParty\HDF5\src\itkhdf5\c++\src \
	$$InsightToolkit\Modules\ThirdParty\HDF5\src\itkhdf5\c++\src \
	$$ITK\Modules\ThirdParty\HDF5\src\itkhdf5\src \
	$$InsightToolkit\Modules\ThirdParty\Eigen3\src\itkeigen\.. \
	$$ITK\Modules\ThirdParty\Eigen3\src\itkeigen\..

QMAKE_LIBDIR += ..\..\common

LIBS += common.lib \
        QGLViewer2.lib \
        opengl32.lib \
        glew32.lib \
        glu32.lib \
        crypt32.lib \
	rpcrt4.lib \
	comctl32.lib \
	wsock32.lib \
	ws2_32.lib \
	Psapi.lib \
	kernel32.lib \
	user32.lib \
	gdi32.lib \
	winspool.lib \
	shell32.lib \
	ole32.lib \
	oleaut32.lib \
	uuid.lib \
	comdlg32.lib \
	advapi32.lib \
	$$ITK\lib\Release\itkdouble-conversion-5.0.lib \
	$$ITK\lib\Release\itksys-5.0.lib \
	$$ITK\lib\Release\itkvnl_algo-5.0.lib \
	$$ITK\lib\Release\itkvnl-5.0.lib \
	$$ITK\lib\Release\itkv3p_netlib-5.0.lib \
	$$ITK\lib\Release\itknetlib-5.0.lib \
	$$ITK\lib\Release\itkvcl-5.0.lib \
	$$ITK\lib\Release\ITKCommon-5.0.lib \
	$$ITK\lib\Release\itkNetlibSlatec-5.0.lib \
	$$ITK\lib\Release\ITKStatistics-5.0.lib \
	$$ITK\lib\Release\ITKTransform-5.0.lib \
	$$ITK\lib\Release\ITKMesh-5.0.lib \
	$$ITK\lib\Release\itkzlib-5.0.lib \
	$$ITK\lib\Release\ITKMetaIO-5.0.lib \
	$$ITK\lib\Release\ITKSpatialObjects-5.0.lib \
	$$ITK\lib\Release\ITKPath-5.0.lib \
	$$ITK\lib\Release\ITKLabelMap-5.0.lib \
	$$ITK\lib\Release\ITKQuadEdgeMesh-5.0.lib \
	$$ITK\lib\Release\ITKIOImageBase-5.0.lib \
	$$ITK\lib\Release\ITKOptimizers-5.0.lib \
	$$ITK\lib\Release\ITKPolynomials-5.0.lib \
	$$ITK\lib\Release\ITKBiasCorrection-5.0.lib \
	$$ITK\lib\Release\ITKDICOMParser-5.0.lib \
	$$ITK\lib\Release\ITKEXPAT-5.0.lib \
	$$ITK\lib\Release\itkgdcmDICT-5.0.lib \
	$$ITK\lib\Release\itkgdcmMSFF-5.0.lib \
	$$ITK\lib\Release\ITKznz-5.0.lib \
	$$ITK\lib\Release\ITKniftiio-5.0.lib \
	$$ITK\lib\Release\ITKgiftiio-5.0.lib \
	$$ITK\lib\Release\libitkhdf5_cpp.lib \
	$$ITK\lib\Release\libitkhdf5.lib \
	$$ITK\lib\Release\ITKIOBMP-5.0.lib \
	$$ITK\lib\Release\ITKIOBioRad-5.0.lib \
	$$ITK\lib\Release\ITKIOBruker-5.0.lib \
	$$ITK\lib\Release\ITKIOCSV-5.0.lib \
	$$ITK\lib\Release\ITKIOGDCM-5.0.lib \
	$$ITK\lib\Release\ITKIOIPL-5.0.lib \
	$$ITK\lib\Release\ITKIOGE-5.0.lib \
	$$ITK\lib\Release\ITKIOGIPL-5.0.lib \
	$$ITK\lib\Release\ITKIOHDF5-5.0.lib \
	$$ITK\lib\Release\itkjpeg-5.0.lib \
	$$ITK\lib\Release\ITKIOJPEG-5.0.lib \
	$$ITK\lib\Release\itkopenjpeg-5.0.lib \
	$$ITK\lib\Release\ITKIOJPEG2000-5.0.lib \
	$$ITK\lib\Release\itktiff-5.0.lib \
	$$ITK\lib\Release\ITKIOTIFF-5.0.lib \
	$$ITK\lib\Release\ITKIOLSM-5.0.lib \
	$$ITK\lib\Release\itkminc2-5.0.lib \
	$$ITK\lib\Release\ITKIOMINC-5.0.lib \
	$$ITK\lib\Release\ITKIOMRC-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshBase-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshBYU-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshFreeSurfer-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshGifti-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshOBJ-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshOFF-5.0.lib \
	$$ITK\lib\Release\ITKIOMeshVTK-5.0.lib \
	$$ITK\lib\Release\ITKIOMeta-5.0.lib \
	$$ITK\lib\Release\ITKIONIFTI-5.0.lib \
	$$ITK\lib\Release\ITKNrrdIO-5.0.lib \
	$$ITK\lib\Release\ITKIONRRD-5.0.lib \
	$$ITK\lib\Release\itkpng-5.0.lib \
	$$ITK\lib\Release\ITKIOPNG-5.0.lib \
	$$ITK\lib\Release\ITKIOSiemens-5.0.lib \
	$$ITK\lib\Release\ITKIOXML-5.0.lib \
	$$ITK\lib\Release\ITKIOSpatialObjects-5.0.lib \
	$$ITK\lib\Release\ITKIOStimulate-5.0.lib \
	$$ITK\lib\Release\ITKTransformFactory-5.0.lib \
	$$ITK\lib\Release\ITKIOTransformBase-5.0.lib \
	$$ITK\lib\Release\ITKIOTransformHDF5-5.0.lib \
	$$ITK\lib\Release\ITKIOTransformInsightLegacy-5.0.lib \
	$$ITK\lib\Release\ITKIOTransformMatlab-5.0.lib \
	$$ITK\lib\Release\ITKIOVTK-5.0.lib \
	$$ITK\lib\Release\ITKKLMRegionGrowing-5.0.lib \
	$$ITK\lib\Release\itklbfgs-5.0.lib \
	$$ITK\lib\Release\ITKOptimizersv4-5.0.lib \
	$$ITK\lib\Release\ITKTestKernel-5.0.lib \
	$$ITK\lib\Release\ITKVTK-5.0.lib \
	$$ITK\lib\Release\ITKVideoCore-5.0.lib \
	$$ITK\lib\Release\ITKVideoIO-5.0.lib \
	$$ITK\lib\Release\ITKWatersheds-5.0.lib \
	$$ITK\lib\Release\itkgdcmIOD-5.0.lib \
	$$ITK\lib\Release\itkgdcmDSED-5.0.lib \
	$$ITK\lib\Release\itkgdcmCommon-5.0.lib \
	$$ITK\lib\Release\itkgdcmjpeg8-5.0.lib \
	$$ITK\lib\Release\itkgdcmjpeg12-5.0.lib \
	$$ITK\lib\Release\itkgdcmjpeg16-5.0.lib \
	$$ITK\lib\Release\itkgdcmopenjp2-5.0.lib \
	$$ITK\lib\Release\itkgdcmcharls-5.0.lib \
	$$ITK\lib\Release\ITKVNLInstantiation-5.0.lib

}

unix {
  !macx {

DESTDIR = ../../../../bin/renderplugins/ITK

INCLUDEPATH += ../../../ \
	/usr/local/include \
	$$InsightToolkit/Modules/Core/Common/include \
	$$InsightToolkit/Modules/IO/GDCM/include \
	$$InsightToolkit/Modules/IO/ImageBase/include \
	$$InsightToolkit/Modules/IO/Meta/include \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/MediaStorageAndFileFormat \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition \
	$$InsightToolkit/Modules/ThirdParty/MetaIO/src/MetaIO \
	$$InsightToolkit/Modules/ThirdParty/VNL/src/vxl/core \
	$$InsightToolkit/Modules/ThirdParty/VNL/src/vxl/vcl \
	$$InsightToolkit/Modules/ThirdParty/ZLIB/src \
	$$InsightToolkit/Modules/Segmentation/RegionGrowing/include \
	$$InsightToolkit/Modules/Segmentation/ConnectedComponents/include \
	$$InsightToolkit/Modules/Segmentation/LabelVoting/include \
	$$InsightToolkit/Modules/Segmentation/Watersheds/include \
	$$InsightToolkit/Modules/Core/ImageFunction/include \
	$$InsightToolkit/Modules/Filtering/Thresholding/include \
	$$InsightToolkit/Modules/Filtering/ImageIntensity/include \
	$$InsightToolkit/Modules/Filtering/ImageGradient/include \
	$$InsightToolkit/Modules/Filtering/ImageGrid/include \
	$$InsightToolkit/Modules/Filtering/ImageFilterBase/include \
	$$InsightToolkit/Modules/Filtering/MathematicalMorphology/include \
	$$InsightToolkit/Modules/Nonunit/Review/include \
	$$ITK/Modules/Core/Common \
	$$ITK/Modules/IO/ImageBase \
	$$ITK/Modules/ThirdParty/GDCM \
	$$ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
	$$ITK/Modules/ThirdParty/KWSys/src \
	$$ITK/Modules/ThirdParty/VNL/src/vxl/core \
	$$ITK/Modules/ThirdParty/VNL/src/vxl/vcl \
	$$ITK/Modules/ThirdParty/MetaIO/src/MetaIO \
	$$ITK/Modules/ThirdParty/ZLIB/src

  QMAKE_LIBDIR += ../../common 

  LIBS += -lcommon \
	-lQGLViewer \
        -lGLEW \
 	-lglut \
	-lGLU

  LIBS += -lm -lstdc++ \
        -litksys-$$ITKVer \        
	-litkzlib-$$ITKVer \
	-litkvnl_algo-$$ITKVer \
	-litkvnl-$$ITKVer \
	-litkvcl-$$ITKVer \
	-litkv3p_netlib-$$ITKVer \
	-litkv3p_netlib-$$ITKVer \
	-litkv3p_lsqr-$$ITKVer \
	-litktiff-$$ITKVer \
	-litksys-$$ITKVer \
	-litkpng-$$ITKVer \
	-litkopenjpeg-$$ITKVer \
	-litkjpeg-$$ITKVer \
	-litkhdf5_cpp-$$ITKVer \
	-litkhdf5-$$ITKVer \
	-litkgdcmuuid-$$ITKVer \
	-litkgdcmjpeg8-$$ITKVer \
	-litkgdcmjpeg16-$$ITKVer \
	-litkgdcmjpeg12-$$ITKVer \
	-litkgdcmMSFF-$$ITKVer \
	-litkgdcmIOD-$$ITKVer \
	-litkgdcmDSED-$$ITKVer \
	-litkgdcmDICT-$$ITKVer \
	-litkgdcmCommon-$$ITKVer \
	-litkNetlibSlatec-$$ITKVer \
	-lITKznz-$$ITKVer \
	-lITKniftiio-$$ITKVer \
	-lITKgiftiio-$$ITKVer \
	-lITKWatersheds-$$ITKVer \
	-lITKVideoIO-$$ITKVer \
	-lITKVideoCore-$$ITKVer \
	-lITKVTK-$$ITKVer \
	-lITKVNLInstantiation-$$ITKVer \
	-lITKStatistics-$$ITKVer \
	-lITKSpatialObjects-$$ITKVer \
	-lITKReview-$$ITKVer \
	-lITKQuadEdgeMesh-$$ITKVer \
	-lITKPolynomials-$$ITKVer \
	-lITKPath-$$ITKVer \
	-lITKOptimizersv4-$$ITKVer \
	-lITKOptimizers-$$ITKVer \
	-lITKNrrdIO-$$ITKVer \
	-lITKMetaIO-$$ITKVer \
	-lITKMesh-$$ITKVer \
	-lITKLabelMap-$$ITKVer \
	-lITKKLMRegionGrowing-$$ITKVer \
	-lITKIOXML-$$ITKVer \
	-lITKIOVTK-$$ITKVer \
	-lITKIOTransformMatlab-$$ITKVer \
	-lITKIOTransformInsightLegacy-$$ITKVer \
	-lITKIOTransformHDF5-$$ITKVer \
	-lITKIOTransformBase-$$ITKVer \
	-lITKIOTIFF-$$ITKVer \
	-lITKIOStimulate-$$ITKVer \
	-lITKIOSpatialObjects-$$ITKVer \
	-lITKIOSiemens-$$ITKVer \
	-lITKIOPNG-$$ITKVer \
	-lITKIONRRD-$$ITKVer \
	-lITKIONIFTI-$$ITKVer \
	-lITKIOMeta-$$ITKVer \
	-lITKIOMesh-$$ITKVer \
	-lITKIOLSM-$$ITKVer \
	-lITKIOJPEG-$$ITKVer \
	-lITKIOImageBase-$$ITKVer \
	-lITKIOIPL-$$ITKVer \
	-lITKIOHDF5-$$ITKVer \
	-lITKIOGIPL-$$ITKVer \
	-lITKIOGE-$$ITKVer \
	-lITKIOGDCM-$$ITKVer \
	-lITKIOCSV-$$ITKVer \
	-lITKIOBioRad-$$ITKVer \
	-lITKIOBMP-$$ITKVer \
	-lITKFEM-$$ITKVer \
	-lITKEXPAT-$$ITKVer \
	-lITKDICOMParser-$$ITKVer \
	-lITKCommon-$$ITKVer \
	-lITKBioCell-$$ITKVer \
	-lITKBiasCorrection-$$ITKVer

 }
}

macx {
  DESTDIR = ../../../../bin/drishti.app/renderplugins/ITK

  INCLUDEPATH += ../../../ \
	/usr/local/include \
	$$InsightToolkit/Modules/Core/Common/include \
	$$InsightToolkit/Modules/IO/GDCM/include \
	$$InsightToolkit/Modules/IO/ImageBase/include \
	$$InsightToolkit/Modules/IO/Meta/include \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/MediaStorageAndFileFormat \
	$$InsightToolkit/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition \
	$$InsightToolkit/Modules/ThirdParty/MetaIO/src/MetaIO \
	$$InsightToolkit/Modules/ThirdParty/VNL/src/vxl/core \
	$$InsightToolkit/Modules/ThirdParty/VNL/src/vxl/vcl \
	$$InsightToolkit/Modules/ThirdParty/ZLIB/src \
	$$InsightToolkit/Modules/Segmentation/RegionGrowing/include \
	$$InsightToolkit/Modules/Segmentation/ConnectedComponents/include \
	$$InsightToolkit/Modules/Core/ImageFunction/include \
	$$InsightToolkit/Modules/Filtering/Thresholding/include \
	$$InsightToolkit/Modules/Filtering/ImageIntensity/include \
	$$InsightToolkit/Modules/Filtering/ImageFilterBase/include \
	$$ITK/Modules/Core/Common \
	$$ITK/Modules/IO/ImageBase \
	$$ITK/Modules/ThirdParty/GDCM \
	$$ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
	$$ITK/Modules/ThirdParty/KWSys/src \
	$$ITK/Modules/ThirdParty/VNL/src/vxl/core \
	$$ITK/Modules/ThirdParty/VNL/src/vxl/vcl \
	$$ITK/Modules/ThirdParty/MetaIO/src/MetaIO \
	$$ITK/Modules/ThirdParty/ZLIB/src


  LIBS += -L../../common

  LIBS += -lcommon -lGLEW -framework QGLViewer -framework GLUT

  LIBS += -lm -lstdc++ \
        -litksys-$$ITKVer \        
	-litkzlib-$$ITKVer \
	-litkvnl_algo-$$ITKVer \
	-litkvnl-$$ITKVer \
	-litkvcl-$$ITKVer \
	-litkv3p_netlib-$$ITKVer \
	-litkv3p_netlib-$$ITKVer \
	-litkv3p_lsqr-$$ITKVer \
	-litktiff-$$ITKVer \
	-litksys-$$ITKVer \
	-litkpng-$$ITKVer \
	-litkopenjpeg-$$ITKVer \
	-litkjpeg-$$ITKVer \
	-litkhdf5_cpp-$$ITKVer \
	-litkhdf5-$$ITKVer \
	-litkgdcmuuid-$$ITKVer \
	-litkgdcmjpeg8-$$ITKVer \
	-litkgdcmjpeg16-$$ITKVer \
	-litkgdcmjpeg12-$$ITKVer \
	-litkgdcmMSFF-$$ITKVer \
	-litkgdcmIOD-$$ITKVer \
	-litkgdcmDSED-$$ITKVer \
	-litkgdcmDICT-$$ITKVer \
	-litkgdcmCommon-$$ITKVer \
	-litkNetlibSlatec-$$ITKVer \
	-lITKznz-$$ITKVer \
	-lITKniftiio-$$ITKVer \
	-lITKgiftiio-$$ITKVer \
	-lITKWatersheds-$$ITKVer \
	-lITKVideoIO-$$ITKVer \
	-lITKVideoCore-$$ITKVer \
	-lITKVTK-$$ITKVer \
	-lITKVNLInstantiation-$$ITKVer \
	-lITKStatistics-$$ITKVer \
	-lITKSpatialObjects-$$ITKVer \
	-lITKReview-$$ITKVer \
	-lITKQuadEdgeMesh-$$ITKVer \
	-lITKPolynomials-$$ITKVer \
	-lITKPath-$$ITKVer \
	-lITKOptimizersv4-$$ITKVer \
	-lITKOptimizers-$$ITKVer \
	-lITKNrrdIO-$$ITKVer \
	-lITKMetaIO-$$ITKVer \
	-lITKMesh-$$ITKVer \
	-lITKLabelMap-$$ITKVer \
	-lITKKLMRegionGrowing-$$ITKVer \
	-lITKIOXML-$$ITKVer \
	-lITKIOVTK-$$ITKVer \
	-lITKIOTransformMatlab-$$ITKVer \
	-lITKIOTransformInsightLegacy-$$ITKVer \
	-lITKIOTransformHDF5-$$ITKVer \
	-lITKIOTransformBase-$$ITKVer \
	-lITKIOTIFF-$$ITKVer \
	-lITKIOStimulate-$$ITKVer \
	-lITKIOSpatialObjects-$$ITKVer \
	-lITKIOSiemens-$$ITKVer \
	-lITKIOPNG-$$ITKVer \
	-lITKIONRRD-$$ITKVer \
	-lITKIONIFTI-$$ITKVer \
	-lITKIOMeta-$$ITKVer \
	-lITKIOMesh-$$ITKVer \
	-lITKIOLSM-$$ITKVer \
	-lITKIOJPEG-$$ITKVer \
	-lITKIOImageBase-$$ITKVer \
	-lITKIOIPL-$$ITKVer \
	-lITKIOHDF5-$$ITKVer \
	-lITKIOGIPL-$$ITKVer \
	-lITKIOGE-$$ITKVer \
	-lITKIOGDCM-$$ITKVer \
	-lITKIOCSV-$$ITKVer \
	-lITKIOBioRad-$$ITKVer \
	-lITKIOBMP-$$ITKVer \
	-lITKFEM-$$ITKVer \
	-lITKEXPAT-$$ITKVer \
	-lITKDICOMParser-$$ITKVer \
	-lITKCommon-$$ITKVer \
	-lITKBioCell-$$ITKVer \
	-lITKBiasCorrection-$$ITKVer
}


HEADERS = connectedcomponent.h \
	label.h
	

SOURCES = connectedcomponent.cpp \
	label.cpp
