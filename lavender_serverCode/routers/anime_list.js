const express = require('express');
const router = express.Router();

const resJson_animeList = [
  {   
    "name":"Rent a girlfriend",
    "logo":"https://upload.wikimedia.org/wikipedia/pt/d/de/Kanojo%2C_Okarishimasu_poster.jpg",
    "type":"m38u",
    "url":"https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
},

] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_animeList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;