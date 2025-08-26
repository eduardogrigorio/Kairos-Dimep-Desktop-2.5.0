
# Instalação do Kairos Dimep Desktop 2.5.0 via GPO
Guia completo para instalação e correção do software

📋
Visão Geral
Este repositório fornece uma solução completa para instalação e correção do software Kairos Dimep Desktop 2.5.0, resolvendo o problema conhecido de exigência desnecessária de privilégios de administrador para usuários comuns.

⚙️
Pré-requisitos Obrigatórios
.NET 6.0 Runtime (x64) - OBRIGATÓRIO
O aplicativo requer o .NET Desktop Runtime 6.0 para funcionar corretamente.

Opções de Instalação:
📥 Download Direto
Instalador oficial da Microsoft

Baixar .NET 6.0
⚡ Instalação Automática
Via PowerShell (execute como administrador)

iwr https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1 -useb | iex; dotnet-install -Runtime windowsdesktop -Version 6.0.36
🔍 Script Batch
Para execução automatizada

@echo off
powershell -Command "iwr https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1 -useb | iex; dotnet-install -Runtime windowsdesktop -Version 6.0.36"
🚀
Processo de Instalação
Instalação do Software Kairos Dimep
Execute o instalador .msi fornecido pela Dimep ou incluso neste repositório seguindo o assistente de instalação padrão.

Aplicação da Correção
Após a instalação, substitua o arquivo original para resolver o erro de exigência de privilégios de administrador:

# Diretório de instalação padrão:
C:\Program Files (x86)\PontoDesk\Kairos Desktop\

# Substitua o arquivo original:
Kairos Desktop.exe (versão original) → Kairos Desktop.exe (versão corrigida)
Importante: Faça backup do arquivo original antes de substituí-lo.
✅ Conclusão
Após seguir esses passos, o Kairos Dimep Desktop deve funcionar corretamente sem solicitar privilégios de administrador para usuários comuns.

🔍
Verificação da Instalação
Para verificar se o .NET Runtime foi instalado corretamente:

# Execute no PowerShell ou Prompt de Comando:
dotnet --list-runtimes | findstr "6.0.36"
⚠️
Solução de Problemas
Problemas Comuns e Soluções
Erro de DLL faltante
Instale o .NET Runtime 6.0 (conforme seção de pré-requisitos)

Solicitação de senha de administrador
Certifique-se de aplicar o arquivo corrigido no diretório de instalação

Falha na inicialização
Verifique se o .NET Runtime 6.0 está instalado corretamente

✨
Benefícios da Correção
Elimina a exigência desnecessária de privilégios de administrador
Mantém a segurança do sistema
Funcionamento normal para usuários comuns
Preserva todas as funcionalidades originais do software
Experiência de usuário melhorada
📞
Suporte
Em caso de dúvidas ou problemas durante a instalação:

Verifique se o .NET Runtime 6.0 está instalado corretamente
Confirme que substituiu o arquivo na pasta correta
Execute o software como administrador uma vez antes de aplicar a correção
