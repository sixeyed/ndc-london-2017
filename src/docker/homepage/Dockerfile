# escape=`
FROM microsoft/windowsservercore
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord
RUN Add-WindowsFeature Web-server
    
COPY index.html c:/inetpub/wwwroot/index.html

EXPOSE 80

COPY ServiceMonitor.exe /
CMD ["C:\\ServiceMonitor.exe", "w3svc"]

HEALTHCHECK CMD powershell -command `
    try { `
     $response = iwr http://localhost:80 -UseBasicParsing; `
     if ($response.StatusCode -eq 200) { return 0} `
     else {return 1}; `
    } catch { return 1 }