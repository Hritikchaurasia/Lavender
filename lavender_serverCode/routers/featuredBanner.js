const express = require('express');
const router = express.Router();

const resJson_featuredBanner = {
    
      "name":"Godzilla vs Kong(Hindi audio)",
      "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
      "type":"m38u",
      "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
     
} ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_featuredBanner);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;