Instalação do Kairos Dimep Desktop 2.5.0
Este repositório contém os arquivos necessários para a instalação do Kairos Dimep Desktop 2.5.0. Siga atentamente as instruções abaixo para garantir uma instalação correta:

🔧 Passo a Passo para Instalação e Correção
📥 Passo 1: Instale o .NET SDK 6.0 (64-bit) – OBRIGATÓRIO
Baixe e instale o dotnet-sdk-6.0.428-win-x64.exe diretamente do site oficial:
🔗 https://builds.dotnet.microsoft.com/dotnet/Sdk/6.0.428/dotnet-sdk-6.0.428-win-x64.exe

Execute o instalador e siga as instruções.

Sem essa etapa, o aplicativo não funcionará corretamente.

⚙️ Passo 2: Instale o Pacote MSI do Kairos Dimep Desktop
Execute o instalador .msi incluso neste repositório (ou fornecido pela Dimep).

Siga o assistente de instalação padrão.

🛠️ Passo 3: Substitua o Arquivo Problemático (Correção do Erro de Admin)
Após a instalação, a versão oficial do Kairos Desktop.exe pode solicitar senha de administrador para usuários comuns, travando o uso do sistema. Para corrigir:

Vá até o diretório de instalação:
C:\Program Files (x86)\PontoDesk\Kairos Desktop\

Substitua o arquivo original Kairos Desktop.exe pelo versão corrigida baixada deste repositório.

✅ Pronto! O sistema agora deve abrir normalmente para usuários comuns, sem exigir privilégios de administrador.
