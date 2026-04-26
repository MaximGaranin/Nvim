return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      -- Цветные иконки
      color_icons = true,
      
      -- Показывать иконку по умолчанию для неизвестных типов файлов
      default = true,
      
      -- Строгий поиск иконок (сначала по имени, потом по расширению)
      strict = true,
      
      -- Вариант темы (dark или light)
      variant = "dark",
      
      -- Прозрачность (0-100)
      blend = 0,
      
      -- Переопределение иконок по расширению файла
      override_by_extension = {
        ["lua"] = {
          icon = "",
          color = "#51a0cf",
          cterm_color = "74",
          name = "Lua",
        },
        ["py"] = {
          icon = "",
          color = "#3572A5",
          cterm_color = "68",
          name = "Python",
        },
        ["rs"] = {
          icon = "",
          color = "#ce422b",
          cterm_color = "1",
          name = "Rust",
        },
        ["toml"] = {
          icon = "",
          color = "#9c4221",
          cterm_color = "95",
          name = "Toml",
        },
        ["yaml"] = {
          icon = "",
          color = "#cb171e",
          cterm_color = "1",
          name = "Yaml",
        },
      },
      
      -- Переопределение иконок по полному имени файла
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          cterm_color = "196",
          name = "Gitignore",
        },
        [".env"] = {
          icon = "",
          color = "#fcc624",
          cterm_color = "220",
          name = "Env",
        },
        ["Dockerfile"] = {
          icon = "",
          color = "#2496ed",
          cterm_color = "33",
          name = "Dockerfile",
        },
        ["Makefile"] = {
          icon = "",
          color = "#c1663f",
          cterm_color = "173",
          name = "Makefile",
        },
        ["package.json"] = {
          icon = "",
          color = "#cb3837",
          cterm_color = "124",
          name = "PackageJson",
        },
        ["package-lock.json"] = {
          icon = "",
          color = "#ac193d",
          cterm_color = "1",
          name = "PackageLockJson",
        },
      },
      
      -- Переопределение иконок по имени папки
      override_by_operating_system = {
        -- Иконки для системных папок
      },
    },
  }
}

