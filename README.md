# Configuração Neovim

Esta é uma configuração personalizada do Neovim.

## Plugins Utilizados

Abaixo está uma lista dos plugins utilizados nesta configuração:

- **catppuccin/nvim**: Tema de cores Catppuccin.
- **nvim-lualine/lualine.nvim**: Barra de status customizável.
    - **nvim-tree/nvim-web-devicons**: Ícones para a lualine e outros plugins.
- **karb94/neoscroll.nvim**: Rolagem suave.
- **lewis6991/gitsigns.nvim**: Integração com Git, mostrando sinais de alterações no gutter.
- **kdheepak/lazygit.nvim**: Interface para o Lazygit dentro do Neovim.
    - **nvim-lua/plenary.nvim**: Biblioteca de utilitários Lua (dependência do lazygit).
- **NeogitOrg/neogit**: Interface Git alternativa.
    - **sindrets/diffview.nvim**: Visualizador de diffs (dependência opcional do neogit).
    - **nvim-telescope/telescope.nvim**: Fuzzy finder (dependência opcional do neogit).
- **folke/which-key.nvim**: Mostra os keymaps disponíveis após pressionar uma tecla líder.
- **nvim-tree/nvim-tree.lua**: Explorador de arquivos.
- **nvim-telescope/telescope.nvim**: Fuzzy finder poderoso para arquivos, buffers, etc.
- **kylechui/nvim-surround**: Gerenciamento de "surrounds" (parênteses, aspas, tags HTML, etc.).
- **goolord/alpha-nvim**: Página inicial customizável.
- **nvim-treesitter/nvim-treesitter**: Melhor highlighting, indentação e outras funcionalidades baseadas em AST.
- **ThePrimeagen/harpoon**: Gerenciamento de arquivos marcados para acesso rápido.
- **stevearc/conform.nvim**: Formatação de código.
- **williamboman/mason.nvim**: Gerenciador de LSPs, formatadores e linters.
- **neovim/nvim-lspconfig**: Configurações para o Language Server Protocol (LSP).
- **sontungexpt/better-diagnostic-virtual-text**: Melhor exibição de diagnósticos.
- **williamboman/mason-lspconfig.nvim**: Integração entre Mason e nvim-lspconfig.
- **nvim-java/nvim-java**: Ferramentas específicas para desenvolvimento Java.
- **mfussenegger/nvim-dap**: Suporte ao Debug Adapter Protocol (DAP) para debugging.
- **rcarriga/nvim-dap-ui**: Interface de usuário para nvim-dap.
    - **nvim-neotest/nvim-nio**: Biblioteca de I/O assíncrona (dependência do nvim-dap-ui).
- **hrsh7th/nvim-cmp**: Framework de autocompletar.
    - **L3MON4D3/LuaSnip**: Gerenciador de snippets.
        - **rafamadriz/friendly-snippets**: Coleção de snippets.
    - **windwp/nvim-autopairs**: Autopreenchimento de pares (parênteses, colchetes, etc.).
    - **saadparwaiz1/cmp_luasnip**: Fonte Luasnip para nvim-cmp.
    - **hrsh7th/cmp-nvim-lua**: Fonte nvim-lua para nvim-cmp.
    - **hrsh7th/cmp-nvim-lsp**: Fonte LSP para nvim-cmp.
    - **hrsh7th/cmp-buffer**: Fonte de buffer para nvim-cmp.
    - **hrsh7th/cmp-path**: Fonte de caminho para nvim-cmp.

## Keymaps

Abaixo estão alguns dos principais mapeamentos de teclas personalizados:

### Modo Normal

- `J`: Une linhas mantendo o cursor na posição.
- `<C-d>`: Rola meia página para baixo e centraliza.
- `<C-u>`: Rola meia página para cima e centraliza.
- `<leader>p` (em modo visual): Cola sobre a seleção sem copiar para o registrador.
- `,<Space>`: Remove o destaque da pesquisa.
- `<C-k>`: Vai para o próximo item na quickfix list e centraliza.
- `<C-j>`: Vai para o item anterior na quickfix list e centraliza.
- `<leader><Tab>`: Lista buffers (Telescope).
- `<M-->`: Diminui a altura da janela.
- `<M-=>`: Aumenta a altura da janela.
- `n`: Próxima ocorrência da pesquisa e centraliza.
- `N`: Ocorrência anterior da pesquisa e centraliza.
- `<C-h>`: Muda para a janela da ESQUERDA.
- `<C-l>`: Muda para a janela da DIREITA.
- `<C-n>`: Alterna o NvimTree.
- `<C-j>`: Muda para a janela de BAIXO.
- `<C-k>`: Muda para a janela de CIMA.
- `<C-s>`: Salva o arquivo.
- `<C-c>`: Copia o conteúdo do arquivo inteiro.

### Modo de Inserção

- `<C-;>`: Adiciona `;` no final da linha e retorna ao modo normal.
- `<C-,>`: Adiciona `,` no final da linha e retorna ao modo normal.
- `<C-a>`: Vai para o início da linha (equivalente a `<Esc>I`).
- `<C-b>`: Move o cursor para a esquerda.
- `<C-e>`: Vai para o final da linha.
- `<C-f>`: Move o cursor para a direita.
- `<C-h>`: Move o cursor para a esquerda.
- `<C-l>`: Move o cursor para a direita.
- `<C-j>`: Move o cursor para baixo.
- `<C-k>`: Move o cursor para cima.

### Modo Visual

- `<C-j>`: Move as linhas selecionadas para BAIXO.
- `<C-k>`: Move as linhas selecionadas para CIMA.
- `<`: Indenta as linhas selecionadas para a ESQUERDA.
- `>`: Indenta as linhas selecionadas para a DIREITA.

### Leader

- `<leader>/`: Alterna comentário (normal e visual).
- `,.`: Alterna entre buffers.

#### Leader + c (Code)
- (Nenhum mapeamento específico listado sob este grupo no arquivo `mappings.lua`)

#### Leader + d (DAP - Debug Adapter Protocol)
- `<leader>dB`: Define um breakpoint com condição.
- `<leader>db`: Alterna breakpoint.
- `<leader>dc`: Continua a execução.
- `<leader>da`: Continua a execução com argumentos.
- `<leader>dC`: Executa até o cursor.
- `<leader>dg`: Vai para a linha (sem executar).
- `<leader>di`: Entra na função (Step Into).
- `<leader>dj`: Move para baixo na stack de debug.
- `<leader>dk`: Move para cima na stack de debug.
- `<leader>dl`: Executa o último comando de debug.
- `<leader>do`: Sai da função (Step Out).
- `<leader>dO`: Passa por cima da função (Step Over).
- `<leader>dP`: Pausa a execução.
- `<leader>dr`: Alterna o REPL de debug.
- `<leader>ds`: Mostra a sessão de debug.
- `<leader>dt`: Termina a sessão de debug.
- `<leader>dw`: Mostra widgets de debug (hover).
- `<leader>du`: Alterna a UI do DAP.
- `<leader>de`: Avalia expressão (normal e visual).

#### Leader + f (File)
- `<leader>ff`: Encontra todos os arquivos (Telescope, incluindo ocultos e ignorados).
- `<leader>fb`: Procura no buffer atual (Telescope).
- `<C-p>`: Encontra arquivos (Telescope).
- `<leader>fm`: Formata o arquivo.
- `<leader>fo`: Encontra arquivos recentes (Telescope).
- `<leader>fw`: Pesquisa em tempo real (Live Grep - Telescope).

#### Leader + g (Git)
- `<leader>gs`: Abre o status do Git (Neogit).
- `<leader>gS`: Mostra o status do Git (Telescope).
- `<leader>gc`: Mostra commits do Git (Telescope).
- `<leader>gb`: Mostra o blame do Git para a linha atual.
- `<leader>gB`: Alterna o blame do Git para a linha atual (completo).
- `<leader>gl`: Abre o LazyGit.

#### Leader + h (Harpoon)
- (Mapeamentos específicos do Harpoon são configurados em `config/harpoon.lua` e não diretamente em `mappings.lua`, mas são acessados através deste grupo)

#### Leader + m (Marks)
- `<leader>mf`: Encontra marcas (Telescope).

#### Leader + q (Quit)
- `<leader>q`: Fecha o buffer atual.
- `<leader>Q`: Fecha o Neovim (sem salvar).

#### Leader + s (Source)
- `<leader>sf`: Executa (source) o arquivo atual.

#### Leader + w (Workspace)
- (Nenhum mapeamento específico listado sob este grupo no arquivo `mappings.lua`)

#### Leader + y (Yank)
- `<leader>y` (normal, inserção, visual): Copia para a área de transferência do sistema.

---

*Este README foi gerado automaticamente.*
