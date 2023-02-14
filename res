<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=ftfr, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.2/axios.min.js"></script>
    <title>Restaurant</title>
</head>
<body>
    <div class="container">
        <form>
            <label class="form-label" >Choose Price</label>
            <input type="text" id="price" class="form-control" >
            <label class="form-label" >Choose Dish</label>
            <input type="text" id="dish" class="form-control" >
            <label class="form-label" >Choose a Table</label>
            <select class="form-select" id="table" class="form-control" >
                <option>Table 1</option>
                <option>Table 2</option>
                <option>Table 3</option>
                
            </select>
            <input type="submit" class="btn btn-dark" id = 'submit'>
        </form>
    </div>
    
        <ul class="row"  id="t1" style="font-weight: 700;">Table 1</ul>
        <ul class="row"  id="t2" style="font-weight: 700;">Table 2</ul>
        <ul class="row"  id="t3" style="font-weight: 700;">Table 3</ul>

</body>


<script>
window.addEventListener("DOMContentLoaded",()=>{
    axios.get('https://crudcrud.com/api/ad54e5a80d804b82812f1e1f1f8f7c6a')
    .then((res)=>{
        for(let i=0;i<res.data.length;i++){
            price = res.data[i].price;
            dish = res.data[i].dish;
            table = res.data[i].table;
            id = res.data[i]._id;
            

            if(table=='Table 1'){
                let t1= document.getElementById('t1')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                t1.innerHTML = t1.innerHTML + li;
            }
            else if(table=='Table 2'){
                let t2= document.getElementById('t2')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                t2.innerHTML = t2.innerHTML + li;
            }
            else if(table=='Table 3'){
                let t3= document.getElementById('t3')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                t3.innerHTML = t3.innerHTML + li;
            }

        }
    })
})



document.getElementById('submit').addEventListener('click',addItem);
async function addItem(event){
    event.preventDefault();

    // Get input value
    const price = document.getElementById('price').value;
    const dish = document.getElementById('dish').value;
    const table= document.getElementById('table').value;
    console.log("data ===> "+price,dish,table)

    let obj = {
        price:price,
        dish:dish,
        table:table
    }

    await axios.post("https://crudcrud.com/api/ad54e5a80d804b82812f1e1f1f8f7c6a/orders/",obj)
    .then((response) => {
        displayOnScreen(response.data);
    })  
    .catch((err) => {
        console.log(err)
    })

}


function displayOnScreen(res){
    console.log(res);
  
            price = res.price;
            dish = res.dish;
            table = res.table;
            id = res._id;
            

            if(table=='Table 1'){
                let t1= document.getElementById('t1')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                
                t1.innerHTML = t1.innerHTML + li;
            }
            else if(table=='Table 2'){
                let t2= document.getElementById('t2')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                t2.innerHTML = t2.innerHTML + li;
            }
            else if(table=='Table 3'){
                let t3= document.getElementById('t3')
                var li = `<li id="${id}" style="list-style: none;"> ${price} - ${dish}<button  onClick="removeItem('${id}')">delete</button> </li>`;
                t3.innerHTML = t3.innerHTML + li;
            }

}

async function removeItem(e) {
    await axios.delete(`https://crudcrud.com/api/ad54e5a80d804b82812f1e1f1f8f7c6a/orders/${id}`)
    location.reload();
}
</script>
</html>
