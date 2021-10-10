const express = require('express');
const router = express.Router();

const resJson_animationMovieList = [
  {   
    "name":"Panda Vs Aliens(720p)",
    "logo":"https://upload.wikimedia.org/wikipedia/en/a/ac/PandavsAliens.jpg",
    "type":"m38u",
    "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
    "language":"English",
    "description":"A group of aliens seek out to conquer new worlds and take particular notice of Earth, after seeing satellite broadcasts of TV shows of a powerful panda, Pandy."
},

] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_animationMovieList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;