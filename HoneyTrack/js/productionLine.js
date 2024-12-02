const searchBar = document.getElementById('search-bar');
const editForm = document.getElementById('editForm');
const button = document.getElementById('.btn-edit');
const format2 = document.getElementById('searchForm');

button.forEach(button => {
    button.addEventListener("click", e => {
        e.preventDefault();
        format2.style.display = 'none';
        editForm.style.display = 'block';
    });
});

// Filtrar resultados en la tabla
searchBar.addEventListener('input', () => {
    const filterText = searchBar.value.toLowerCase();
    Array.from(tableBody.getElementsByTagName('tr')).forEach(row => {
        const cells = row.getElementsByTagName('td');
        const match = Array.from(cells).some(cell => 
            cell.textContent.toLowerCase().includes(filterText)
        );
        row.style.display = match ? '' : 'none';
    });
});