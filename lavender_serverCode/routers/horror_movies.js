const express = require('express');
const router = express.Router();

const resJson_horrorMoviesList = [
   
    {   
        "name":"Blue call(360p)",
        "logo":"https://m.media-amazon.com/images/M/MV5BZjk4NzlhMjYtMjhlZi00MjIzLWFkZjAtMzBhMWZhNjZhNDExXkEyXkFqcGdeQXVyMjIxODA2MTA@._V1_FMjpg_UY682_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"English",
        "description":"Haylee, a local EMT suffering from PTSD, spends her days making split second decisions with lives that hang in the balance. One night on a routine call, she is faced with a moral decision, taking matters into her own hands and mercy kills a young woman. Her decision opens a pandora's box that leads Haylee to blur the lines of her job responsibilities and wanting to help those in need. Now, falling deeper and deeper into a rabbit hole, she gets caught up in a world of underground drugs and a sadistic killer who's made her his next victim."
    },
    {   
        "name":"Blue call(720p)",
        "logo":"https://m.media-amazon.com/images/M/MV5BZjk4NzlhMjYtMjhlZi00MjIzLWFkZjAtMzBhMWZhNjZhNDExXkEyXkFqcGdeQXVyMjIxODA2MTA@._V1_FMjpg_UY682_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"English",
        "description":"Haylee, a local EMT suffering from PTSD, spends her days making split second decisions with lives that hang in the balance. One night on a routine call, she is faced with a moral decision, taking matters into her own hands and mercy kills a young woman. Her decision opens a pandora's box that leads Haylee to blur the lines of her job responsibilities and wanting to help those in need. Now, falling deeper and deeper into a rabbit hole, she gets caught up in a world of underground drugs and a sadistic killer who's made her his next victim."
    },
   

] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_horrorMoviesList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;