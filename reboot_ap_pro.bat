@echo off
REM teste de reinicio dos aps_com_ping
timeout /t 10 /nobreak
REM enviar_relatorio por e-mail
set subject="Reboot APS AvilaSec"
set email_from=msn.networking@linkconsulting.com
set email_cc=felisberto.monteiro@linkconsulting.com
set email_to=felisbertocv@gmail.com

set body="Os aps da infrastrutura AvilaSec foram reiniciados Consulte o endereço: https://psunificontroller.aitec.pt:8443, para verificar os seus estados."
set server=psmail2013.aitec.pt
blat.exe -attach "C:\rebootunifi\relatorios\log_ap_reboot_%date%.txt" -p configsmtp -to %email_to% -cc %email_cc% -subject %subject% -body %body% -server %server% -f %email_from%
pause