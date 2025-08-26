<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instalação do Kairos Dimep Desktop 2.5.0</title>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #27ae60;
            --warning: #f39c12;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 2rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        
        .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            border-bottom: 2px solid var(--light);
            padding-bottom: 0.5rem;
        }
        
        .icon {
            font-size: 1.8rem;
            margin-right: 10px;
        }
        
        h2 {
            color: var(--primary);
            font-size: 1.5rem;
        }
        
        h3 {
            color: var(--secondary);
            margin: 1rem 0;
        }
        
        .prerequisites {
            background-color: #e8f4fc;
            border-left: 4px solid var(--secondary);
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }
        
        .code-block {
            background-color: #2d3a4b;
            color: #f8f8f2;
            padding: 1rem;
            border-radius: 5px;
            margin: 1rem 0;
            overflow-x: auto;
            font-family: 'Consolas', monospace;
        }
        
        .step {
            counter-increment: step-counter;
            margin-bottom: 1.5rem;
            padding-left: 2.5rem;
            position: relative;
        }
        
        .step:before {
            content: counter(step-counter);
            background-color: var(--secondary);
            color: white;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            left: 0;
            top: 0;
            font-weight: bold;
        }
        
        .option-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1rem;
            margin: 1rem 0;
        }
        
        .option-card {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1rem;
            border: 1px solid #e9ecef;
        }
        
        .btn {
            display: inline-block;
            background-color: var(--secondary);
            color: white;
            padding: 0.7rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 0.5rem;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: var(--primary);
        }
        
        .warning {
            background-color: #fff3e0;
            border-left: 4px solid var(--warning);
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }
        
        .success {
            background-color: #e8f5e9;
            border-left: 4px solid var(--success);
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }
        
        .troubleshooting {
            background-color: #ffebee;
            border-left: 4px solid var(--accent);
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }
        
        .benefits-list {
            list-style-type: none;
        }
        
        .benefits-list li {
            margin-bottom: 0.8rem;
            padding-left: 1.8rem;
            position: relative;
        }
        
        .benefits-list li:before {
            content: "✓";
            color: var(--success);
            position: absolute;
            left: 0;
            font-weight: bold;
        }
        
        footer {
            text-align: center;
            margin-top: 2rem;
            padding: 1rem;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .option-grid {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Instalação do Kairos Dimep Desktop 2.5.0</h1>
            <p class="subtitle">Guia completo para instalação e correção do software</p>
        </header>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">📋</span>
                <h2>Visão Geral</h2>
            </div>
            <p>Este repositório fornece uma solução completa para instalação e correção do software <strong>Kairos Dimep Desktop 2.5.0</strong>, resolvendo o problema conhecido de exigência desnecessária de privilégios de administrador para usuários comuns.</p>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">⚙️</span>
                <h2>Pré-requisitos Obrigatórios</h2>
            </div>
            
            <div class="prerequisites">
                <h3>.NET 6.0 Runtime (x64) - OBRIGATÓRIO</h3>
                <p>O aplicativo requer o .NET Desktop Runtime 6.0 para funcionar corretamente.</p>
            </div>
            
            <h3>Opções de Instalação:</h3>
            
            <div class="option-grid">
                <div class="option-card">
                    <h3>📥 Download Direto</h3>
                    <p>Instalador oficial da Microsoft</p>
                    <a href="https://dotnet.microsoft.com/pt-br/download/dotnet/thank-you/runtime-desktop-6.0.36-windows-x64-installer" class="btn" target="_blank">Baixar .NET 6.0</a>
                </div>
                
                <div class="option-card">
                    <h3>⚡ Instalação Automática</h3>
                    <p>Via PowerShell (execute como administrador)</p>
                    <div class="code-block">
                        iwr https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1 -useb | iex; dotnet-install -Runtime windowsdesktop -Version 6.0.36
                    </div>
                </div>
                
                <div class="option-card">
                    <h3>🔍 Script Batch</h3>
                    <p>Para execução automatizada</p>
                    <div class="code-block">
                        @echo off<br>
                        powershell -Command "iwr https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1 -useb | iex; dotnet-install -Runtime windowsdesktop -Version 6.0.36"
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">🚀</span>
                <h2>Processo de Instalação</h2>
            </div>
            
            <div class="step">
                <h3>Instalação do Software Kairos Dimep</h3>
                <p>Execute o instalador <code>.msi</code> fornecido pela Dimep ou incluso neste repositório seguindo o assistente de instalação padrão.</p>
            </div>
            
            <div class="step">
                <h3>Aplicação da Correção</h3>
                <p>Após a instalação, substitua o arquivo original para resolver o erro de exigência de privilégios de administrador:</p>
                <div class="code-block">
                    # Diretório de instalação padrão:<br>
                    C:\Program Files (x86)\PontoDesk\Kairos Desktop\<br><br>
                    
                    # Substitua o arquivo original:<br>
                    Kairos Desktop.exe (versão original) → Kairos Desktop.exe (versão corrigida)
                </div>
                <div class="warning">
                    <strong>Importante:</strong> Faça backup do arquivo original antes de substituí-lo.
                </div>
            </div>
            
            <div class="success">
                <h3>✅ Conclusão</h3>
                <p>Após seguir esses passos, o Kairos Dimep Desktop deve funcionar corretamente sem solicitar privilégios de administrador para usuários comuns.</p>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">🔍</span>
                <h2>Verificação da Instalação</h2>
            </div>
            
            <p>Para verificar se o .NET Runtime foi instalado corretamente:</p>
            <div class="code-block">
                # Execute no PowerShell ou Prompt de Comando:<br>
                dotnet --list-runtimes | findstr "6.0.36"
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">⚠️</span>
                <h2>Solução de Problemas</h2>
            </div>
            
            <div class="troubleshooting">
                <h3>Problemas Comuns e Soluções</h3>
                
                <div class="step">
                    <h3>Erro de DLL faltante</h3>
                    <p>Instale o .NET Runtime 6.0 (conforme seção de pré-requisitos)</p>
                </div>
                
                <div class="step">
                    <h3>Solicitação de senha de administrador</h3>
                    <p>Certifique-se de aplicar o arquivo corrigido no diretório de instalação</p>
                </div>
                
                <div class="step">
                    <h3>Falha na inicialização</h3>
                    <p>Verifique se o .NET Runtime 6.0 está instalado corretamente</p>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">✨</span>
                <h2>Benefícios da Correção</h2>
            </div>
            
            <ul class="benefits-list">
                <li>Elimina a exigência desnecessária de privilégios de administrador</li>
                <li>Mantém a segurança do sistema</li>
                <li>Funcionamento normal para usuários comuns</li>
                <li>Preserva todas as funcionalidades originais do software</li>
                <li>Experiência de usuário melhorada</li>
            </ul>
        </div>
        
        <div class="card">
            <div class="card-header">
                <span class="icon">📞</span>
                <h2>Suporte</h2>
            </div>
            
            <p>Em caso de dúvidas ou problemas durante a instalação:</p>
            <ol>
                <li>Verifique se o .NET Runtime 6.0 está instalado corretamente</li>
                <li>Confirme que substituiu o arquivo na pasta correta</li>
                <li>Execute o software como administrador uma vez antes de aplicar a correção</li>
            </ol>
        </div>
        
        <footer>
            <p>© 2023 - Guia de Instalação Kairos Dimep Desktop</p>
        </footer>
    </div>

    <script>
        // Adiciona numeração aos passos
        document.addEventListener('DOMContentLoaded', function() {
            const stepsContainer = document.querySelector('.card');
            if (stepsContainer) {
                stepsContainer.style.counterReset = 'step-counter';
            }
            
            // Destaca os blocos de código quando clicados
            const codeBlocks = document.querySelectorAll('.code-block');
            codeBlocks.forEach(block => {
                block.addEventListener('click', function() {
                    const range = document.createRange();
                    range.selectNodeContents(this);
                    const selection = window.getSelection();
                    selection.removeAllRanges();
                    selection.addRange(range);
                });
            });
        });
    </script>
</body>
</html>
