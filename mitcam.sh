#!/usr/bin/env bash

echo 
echo "                  ,,                                              "
echo "\`7MMM.     ,MMF'  db   mm     .g8\"\"\"bgd                        "
echo "  MMMb    dPMM         MM   .dP'     \`M                           "
echo "  M YM   ,M MM  \`7MM mmMMmm dM'       \` ,6\"Yb.  \`7MMpMMMb.pMMMb.  "
echo "  M  Mb  M' MM    MM   MM   MM         8)   MM    MM    MM    MM  "
echo "  M  YM.P'  MM    MM   MM   MM.         ,pm9MM    MM    MM    MM  "
echo "  M  \`YM'   MM    MM   MM   \`Mb.     ,'8M   MM    MM    MM    MM  "
echo ".JML. \`'  .JMML..JMML. \`Mbmo  \`\"bmmmd' \`Moo9^Yo..JMML  JMML  JMML."
                                                                  
                                                                  

if [[ "$1" == c ]] || [[ "$1" == d ]]
then
  if [[ "$1" == c ]]
  then
    echo "Realizando dump do Stream da câmera alvo."
    tshark -Y "ip.src == $2 && tcp.port == $3" -T fields -e data.data >./$4 
    echo "Dump realizado!"
  fi
  if [[ "$1" == d ]]
  then
    echo "Convertendo arquivo de Stream em MP4."
    cat $2 |xxd -r -p > /tmp/$2.dav
    ffmpeg -y -i /tmp/$2.dav -c:v libx264 -crf 24 $3 &>/dev/null
    rm /tmp/$2.dav
    if [[ "$4" == "vlc" ]]
    then
      vlc $3 2>/dev/null
    fi
    echo "Arquivo convertido!"
  fi
else
  echo -e "\n           Interceptação e conversão de Stream de câmeras de seguraça."
  echo -e "\n\033[3;31m                              Criado por MZTBTG\033[m\n"
  echo -e "Modo de uso:\n=> Captura dos dados: $0 c [IP] [Porta] [NomeDeSaída]\n=> Converção de Stream (.DAV): $0 d [file.dav] [file.mp4(saída)]\n"
  echo -e "Exemplo de captura de dados: $0 c 192.168.180.254 54122 stream.dav\nCapture a quantidade de gravação desejada. Toda gravação estará em um arquivo de nome \"stream.dav\".\n"
  echo -e "Exemplo de conversão de captura para vídeo: $0 d stream.dav captura.mp4 [vlc]\nA conversão de arquivo é necessária pois a grande maioria dos reprodutores não conseguem reproduzir arquivos de Stream. Caso queira reproduzir diretamente com VLC, escreva no final da sintaxe \"vlc\", mas é opcional."
fi
