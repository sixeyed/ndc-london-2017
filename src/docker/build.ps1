$msBuildPath = "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"

# publish website:
& $msBuildPath ..\ProductLaunch\ProductLaunch.Web\ProductLaunch.Web.csproj /p:OutputPath=..\..\docker\web\ProductLaunchWeb  /p:DeployOnBuild=true

# publish message handlers:
& $msBuildPath ..\ProductLaunch\ProductLaunch.MessageHandlers.SaveProspect\ProductLaunch.MessageHandlers.SaveProspect.csproj /p:OutputPath=..\..\docker\save-prospect\SaveProspectHandler

# build images:
docker build -t sixeyed/product-launch-web:v3 .\web
docker build -t sixeyed/product-launch-save-handler:v3 .\save-prospect