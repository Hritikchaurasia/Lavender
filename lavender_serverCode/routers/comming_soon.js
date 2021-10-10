const express = require('express');
const router = express.Router();

const resJson_CommingSoon = [
    {
    
        "name":"Godzilla vs Kong(Hindi audio)",
        "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
        "type":"m38u",
        "releaseDate":"21/06/2021",
       
  },{
    
    "name":"Godzilla vs Kong(Hindi audio)",
    "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
    "type":"m38u",
    "releaseDate":"21/06/2021",
   
},{
    
    "name":"Godzilla vs Kong(Hindi audio)",
    "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
    "type":"m38u",
    "releaseDate":"21/06/2021",
   
},{
    
    "name":"Godzilla vs Kong(Hindi audio)",
    "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
    "type":"m38u",
    "releaseDate":"21/06/2021",
   
},
] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_CommingSoon);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;