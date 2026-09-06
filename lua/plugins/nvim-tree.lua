return {
    'nvim-tree/nvim-tree.lua',
    version = '*', -- последний стабильный релиз
    lazy = false, -- загружается сразу при старте (для постоянного доступа)
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- опционально: иконки для файлов
    },
    config = function()
        -- ВАЖНО: отключаем встроенный netrw, чтобы не было конфликтов
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Настройки
        require('nvim-tree').setup({
            -- Сортировка файлов
            sort = {
                sorter = 'case_sensitive',
            },
            -- Отображение
            view = {
                width = 30,
                -- Открывать дерево в левой части экрана
                side = 'left',
                -- Показывать скрытые файлы (начинающиеся с .)
                hide_root_folder = false,
                -- Автоматически обновлять при изменении файлов
                adaptive_size = true,
                mappings = {
                    list = {
                        -- Кастомные клавиши (опционально)
                        { key = 'u', action = 'dir_up' }, -- подняться на уровень выше
                    },
                },
            },
            -- Работа с Git
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            -- Фильтры
            filters = {
                dotfiles = false, -- показывать .файлы
                custom = { '^.git$' }, -- скрыть .git папку
            },
            -- Действия при открытии файлов
            actions = {
                open_file = {
                    -- Как открывать файлы: текущее окно или сплит
                    window_picker = {
                        enable = true,
                    },
                },
            },
            -- Рендеринг иконок
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
        })

        -- Горячие клавиши (рекомендую)
        -- <C-n> - открыть/закрыть дерево
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        -- <C-b> - фокус на дерево
        vim.keymap.set('n', '<C-b>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
    end,
}
