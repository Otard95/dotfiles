return {
  {
    'laytan/cloak.nvim',
    opts = {
      patterns = {
        { file_pattern = '.env*', cloak_pattern = '=.+' },
        {
          file_pattern = 'services.json',
          cloak_pattern = {
            '(pass": ")[^"]*',
            '(password": ")[^"]*',
          },
          replace = '%1',
        }
      }
    },
  },
}
