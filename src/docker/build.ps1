$msBuildPath = "C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"

# publish website:
& $msBuildPath ..\ProductLaunch\ProductLaunch.Web\ProductLaunch.Web.csproj /p:OutputPath=..\..\docker\web\ProductLaunchWeb  /p:DeployOnBuild=true

# build images:
docker build -t sixeyed/product-launch-web:v2 .\web