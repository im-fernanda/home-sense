[FLUTTER_BADGE]: https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white
[FIREBASE]: https://img.shields.io/badge/Firebase-FFCA28?style=flat&logo=Firebase&logoColor=white
[ARDUINO]: https://img.shields.io/badge/Arduino-00878F?logo=arduino&logoColor=fff&style=plastic

<h1 align="center" style="font-weight: bold"> Home Sense 🏡 </h1>

![flutter][FLUTTER_BADGE]
![firebase][FIREBASE]
![arduino][ARDUINO]

<p align="justify">Este projeto consiste na criação de uma <strong>Smart Home</strong> utilizando Flutter, Firebase, ESP32 e Arduino.  
Seu propósito é integrar diversos sensores e atuadores em uma maquete de uma casa, permitindo o monitoramento e controle remoto por meio de um aplicativo mobile.  A comunicação entre os dispositivos ocorre via <strong>UART</strong>, enquanto os dados são armazenados e sincronizados em <strong>tempo real</strong> utilizando o <strong>Firebase Realtime Database</strong>.</p>

 <h2>🚀 Tecnologias Utilizadas</h2>
 
  <h3>📱 Mobile</h3>
  <ul>
      <li>Flutter: Framework para a criação da aplicação mobile.</li>
  </ul>

  <h3>🔌 Hardware</h3>
  <ul>
      <li>ESP32: Microcontrolador responsável pela coleta e envio dos dados dos sensores.</li>
      <li>Arduino: Utilizado para alimentar os <strong>servo motores</strong> e o <strong>display LCD</strong>.</li>
  </ul>

  <h3>🔥 Firebase</h3>
  <ul>
      <li>Firebase Realtime Database: Armazena e sincroniza dados em tempo real.</li>
      <li>Firebase Functions: Manipulação de eventos no backend.</li>
      <li>Firebase Messaging: Envio de notificações em tempo real.</li>
      <li>Firebase Auth: Autenticação de usuários.</li>
  </ul>
  
  <h3>🛠️ Sensores</h3>
  <ul>
      <li>Presença</li>
      <li>Umidade</li>
      <li>Temperatura</li>
      <li>LDR</li>
  </ul>

  <h3>⚙️ Atuadores</h3>
  <ul>
      <li>LEDs</li>
      <li>Servo Motores</li>
      <li>Display LCD</li>
  </ul>

  <h2>📌 Funcionalidades</h2>
    <ul>
        <li>✅ <strong>Controle de Dispositivos</strong>: Controle de LEDs, motores e outros atuadores em tempo real.</li>
        <li>✅ <strong>Monitoração de Sensores</strong>: Presença, temperatura, umidade e luz.</li>
        <li>✅ <strong>Notificações</strong>: Receba alertas em tempo real quando houver mudança na temperatura ou detecção de presença.</li>
        <li>✅ <strong>Autenticação</strong>: Proteção do sistema com Firebase Authentication.</li>
        <li>✅ <strong>Geolocalização</strong>: Identificação da localização do usuário para automatizar ações ao chegar ou sair de casa.</li>
        <li>✅ <strong>Rotinas Automatizadas</strong>: Programação de ações inteligentes, como acender luzes automaticamente quando o usuário chega.</li>
    </ul>

  <h2>🛠️ Como executar</h2>

  <h3>📱 1. Aplicativo Flutter</h3>
  <ul>
      <li>Clone o repositório:</li>
      <pre><code>git clone https://github.com/im-fernanda/home-sense.git
cd home-sense</code></pre>
      <li>Instale as dependências do Flutter:</li>
      <pre><code>flutter pub get</code></pre>
      <li>Execute o aplicativo:</li>
      <pre><code>flutter run</code></pre>
  </ul>
  
  <h3>🔥 2. Firebase</h3>
  <ul>
      <li>Crie um projeto no Firebase.</li>
      <li>Ative os seguintes serviços:</li>
      <ul>
          <li>✅ Realtime Database</li>
          <li>✅ Firebase Auth</li>
          <li>✅ Firebase Functions</li>
          <li>✅ Firebase Messaging</li>
      </ul>
      <li>Baixe as credenciais do Firebase e configure-as no seu aplicativo Flutter.</li>
  </ul>

  <h3>🔌 2. Hardware</h3>
  <ul>
      <li>Configure o ambiente de desenvolvimento com <strong>Arduino IDE</strong> ou na sua plataforma IOT.</li>
      <li>Carregue o código que coleta os dados dos sensores e os envia para o <strong>Firebase</strong>.</li>
      <li>Utilize o(s) ESP32 e/ou Arduino(s) para enviar e receber dados do Firebase.</li>
  </ul>
  
