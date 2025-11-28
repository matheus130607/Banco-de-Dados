function cadastrar(secao) {
      const ids = ['clientes', 'veiculos', 'pecas', 'mecanicos', 'os'];
      
      ids.forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.classList.add('hidden');
            el.classList.remove('form-container'); 
        }
      });

      const mostrar = document.getElementById(secao);
      if (mostrar) {
          mostrar.classList.remove('hidden');
          mostrar.classList.add('form-container');
      } else {
          console.warn('Seção não encontrada:', secao);
      }
}

document.addEventListener('DOMContentLoaded', () => {
    cadastrar('clientes');
});