::============================================================
:: Victor M. dos Santos, v01 - November 10, 2021   ┌─┐┌┬┐┌─┐┬─┐
:: Jonathan T. da Silva, v02 - March 03, 2022      └─┐│││├─┤├┬┘
::                                                 └─┘┴ ┴┴ ┴┴└─
:: LATEST REVISION: v02 - March 03, 2022
:: DESCRIPTION: This file executes a set of commands to 
:: activate and install the pre-requisites features needed for 
:: System302.
::============================================================

@echo off
cls
Title Offline System302 Pre-Check

::============================================================
::-------------------------HEADER-----------------------------
:: https://gist.githubusercontent.com/mlocati/fdabcaeb8071d5c75a2d51712db24011/raw/b710612d6320df7e146508094e84b92b34c77d48/win10colors.cmd
::============================================================
echo [7mNova Smar S/A - Technology Company[0m
echo.
echo .d8888b  88888b.d88b.   8888b.  888d888 
echo 88K      888 "888 "88b     "88b 888P"   
echo "Y8888b. 888  888  888 .d888888 888     
echo      X88 888  888  888 888  888 888     
echo  88888P' 888  888  888 "Y888888 888     
echo.

::============================================================
::------------------------VARIABLES---------------------------
::============================================================

set features=NetFx3^
    IIS-IIS6ManagementCompatibility^
    IIS-ManagementConsole^
    IIS-LegacyScripts^
    IIS-WMICompatibility^
    IIS-NetFxExtensibility^
    IIS-ASP^
    IIS-ISAPIFilter^
    IIS-DefaultDocument^
    IIS-ASPNET^
    IIS-ISAPIExtensions^
    IIS-DirectoryBrowsing^
    IIS-HttpErrors^
    IIS-HttpRedirect^
    IIS-StaticContent

::============================================================
::------------------------FUNCTIONS---------------------------
::============================================================

::OPERATING SYSTEM VERSION
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" (
    echo [7mVerified Operating System: Windows 10/11 / Windows Server 2016/2019/2022.[0m
    echo.
    goto exe
)
if "%version%" == "6.3" (
    echo [7mVerified Operating System: Windows Server 2012 R2.[0m
    echo.
    goto exe
)
if "%version%" == "6.2" (
    echo This version of this file is not compatible with the version of Windows you’re running (Windows Vista / Windows Server 2008).
    echo.
    goto exe
)
if "%version%" == "6.1" (
    echo [7mVerified Operating System: Windows 7 / Windows Server 2008 R2.[0m
    echo.
    goto exe
)
if "%version%" == "6.0" (
    echo This version of this file is not compatible with the version of Windows you’re running (Windows Vista / Windows Server 2008).
    pause
    exit
)
if "%version%" == "5.2" (
    echo This version of this file is not compatible with the version of Windows you’re running (Windows XP 64-Bit Edition / Windows Server 2003 (R2)).
    pause
    exit
)
if "%version%" == "5.1" (
    echo This version of this file is not compatible with the version of Windows you’re running (Windows XP).
    pause
    exit
)
if "%version%" == "5.0" (
    echo This version of this file is not compatible with the version of Windows you’re running (Windows 2000).
    pause
    exit
)

::============================================================
::------------------------EXECUTION---------------------------
::============================================================

:exe
for %%F in (%features%) do (
    echo [ INFO ] Checking %%F feature:
    Dism /Online /Get-FeatureInfo /FeatureName:%%F | findstr "Enabled Habilitado"
    if errorlevel 1 (
	if %%F == NetFx3 (
        echo Copying the files to the directory C:\Windows\ ...
	echo.
        copy /-Y "%~dp0\%version%\*.cab" "%windir%"
	    Dism /Online /Add-Package /PackagePath:"%windir%\microsoft-windows-netfx3-ondemand-package~31bf3856ad364e35~amd64~~.cab
        Dism /Online /Enable-Feature /FeatureName:%%F /All /LimitAccess /Source:"%windir%"
	    echo.
        ) else (
            Dism /Online /Enable-Feature /All /FeatureName:%%F
	    echo.
        )
    ) else (
        echo [  OK  ] This feature is already activated!
	echo.
    )
)

pause