@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  is-mutant-services startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and IS_MUTANT_SERVICES_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\is-mutant-services-0.1.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\json-20180813.jar;%APP_HOME%\lib\modelmapper-jackson-2.3.5.jar;%APP_HOME%\lib\modelmapper-2.3.5.jar;%APP_HOME%\lib\log4j-api-2.12.1.jar;%APP_HOME%\lib\reactor-adapter-3.3.1.RELEASE.jar;%APP_HOME%\lib\reactor-test-3.2.3.RELEASE.jar;%APP_HOME%\lib\micronaut-hibernate-validator-3.0.0.jar;%APP_HOME%\lib\reactor-netty-1.0.3.jar;%APP_HOME%\lib\reactor-netty-http-brave-1.0.3.jar;%APP_HOME%\lib\reactor-netty-http-1.0.3.jar;%APP_HOME%\lib\reactor-netty-core-1.0.3.jar;%APP_HOME%\lib\reactor-core-3.4.2.jar;%APP_HOME%\lib\micronaut-validation-2.3.2.jar;%APP_HOME%\lib\micronaut-http-client-2.3.2.jar;%APP_HOME%\lib\micronaut-http-client-core-2.3.2.jar;%APP_HOME%\lib\micronaut-http-server-netty-2.3.2.jar;%APP_HOME%\lib\micronaut-http-server-2.3.2.jar;%APP_HOME%\lib\micronaut-runtime-2.3.2.jar;%APP_HOME%\lib\micronaut-http-netty-2.3.2.jar;%APP_HOME%\lib\micronaut-websocket-2.3.2.jar;%APP_HOME%\lib\micronaut-router-2.3.2.jar;%APP_HOME%\lib\micronaut-http-2.3.2.jar;%APP_HOME%\lib\micronaut-aop-2.3.2.jar;%APP_HOME%\lib\micronaut-buffer-netty-2.3.2.jar;%APP_HOME%\lib\micronaut-inject-2.3.2.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\swagger-annotations-2.1.6.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\micronaut-core-2.3.2.jar;%APP_HOME%\lib\brave-instrumentation-http-5.13.3.jar;%APP_HOME%\lib\brave-5.13.3.jar;%APP_HOME%\lib\zipkin-reporter-brave-2.16.3.jar;%APP_HOME%\lib\zipkin-reporter-2.16.3.jar;%APP_HOME%\lib\spotbugs-annotations-4.0.3.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\snakeyaml-1.26.jar;%APP_HOME%\lib\slf4j-api-1.7.26.jar;%APP_HOME%\lib\rxjava-2.2.10.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.59.Final.jar;%APP_HOME%\lib\netty-codec-http2-4.1.59.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.59.Final.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.59.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.59.Final.jar;%APP_HOME%\lib\netty-handler-4.1.59.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.59.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-codec-socks-4.1.59.Final.jar;%APP_HOME%\lib\netty-codec-dns-4.1.59.Final.jar;%APP_HOME%\lib\netty-codec-4.1.59.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.59.Final.jar;%APP_HOME%\lib\netty-transport-4.1.59.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.59.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.59.Final.jar;%APP_HOME%\lib\netty-common-4.1.59.Final.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.11.2.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.11.2.jar;%APP_HOME%\lib\jackson-databind-2.11.2.jar;%APP_HOME%\lib\jackson-annotations-2.11.2.jar;%APP_HOME%\lib\jackson-core-2.11.2.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\javax.el-3.0.1-b12.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\hibernate-validator-6.1.6.Final.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\jboss-logging-3.3.2.Final.jar;%APP_HOME%\lib\classmate-1.3.4.jar;%APP_HOME%\lib\zipkin-2.23.2.jar


@rem Execute is-mutant-services
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %IS_MUTANT_SERVICES_OPTS%  -classpath "%CLASSPATH%" mutant.services.com.Application %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable IS_MUTANT_SERVICES_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%IS_MUTANT_SERVICES_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
