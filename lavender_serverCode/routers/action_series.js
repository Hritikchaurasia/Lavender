const express = require('express');
const router = express.Router();

const resJson_actionSeriesList = [
    {   
        "name":"ekk",
        "logo":"https://upload.wikimedia.org/wikipedia/en/a/ac/PandavsAliens.jpg",
        "description":"this is new series",
        "seasons":[
           { 
            "seasonName" : "season1",
            "seasonDescription":"this is first season",
            "seasonLogo":"https://upload.wikimedia.org/wikipedia/en/a/ac/PandavsAliens.jpg",
            "episodes":[
               { 
                "episodeName":"episode1",
                "episodeDescription":"this is first episode" ,
                "episodeUrl":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
                "episodeLogo":"https://upload.wikimedia.org/wikipedia/en/a/ac/PandavsAliens.jpg"
                }
            ]
        
        }
        ],
        "language":"English"
    },

] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_actionSeriesList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;