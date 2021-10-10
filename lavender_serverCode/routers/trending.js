const express = require('express');
const router = express.Router();

const resJson_trendingList = [
    {   
        "name":"Godzilla vs Kong(Hindi audio)",
        "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"Hindi",
        "description":"Godzilla vs. Kong is a 2021 American monster film directed by Adam Wingard. A sequel to Godzilla: King of the Monsters (2019) and Kong: Skull Island (2017), it is the fourth film in Legendary's MonsterVerse. It is also the 36th film in the Godzilla franchise, the 12th film in the King Kong franchise, and the fourth Godzilla film to be completely produced by a Hollywood studio. The film stars Alexander Skarsgård, Millie Bobby Brown, Rebecca Hall, Brian Tyree Henry, Shun Oguri, Eiza González, Julian Dennison, Lance Reddick, Kyle Chandler, and Demián Bichir. In the film, Kong clashes with Godzilla as humans lure the ape into the Hollow Earth to retrieve a power source for a weapon to stop Godzilla's mysterious rampages."
    },  
    
    {   
        "name":"Blue call(720p)",
        "logo":"https://m.media-amazon.com/images/M/MV5BZjk4NzlhMjYtMjhlZi00MjIzLWFkZjAtMzBhMWZhNjZhNDExXkEyXkFqcGdeQXVyMjIxODA2MTA@._V1_FMjpg_UY682_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"English",
        "description":"Haylee, a local EMT suffering from PTSD, spends her days making split second decisions with lives that hang in the balance. One night on a routine call, she is faced with a moral decision, taking matters into her own hands and mercy kills a young woman. Her decision opens a pandora's box that leads Haylee to blur the lines of her job responsibilities and wanting to help those in need. Now, falling deeper and deeper into a rabbit hole, she gets caught up in a world of underground drugs and a sadistic killer who's made her his next victim."
    },
    {   
        "name":"Panda Vs Aliens(720p)",
        "logo":"https://upload.wikimedia.org/wikipedia/en/a/ac/PandavsAliens.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"English",
        "description":"A group of aliens seek out to conquer new worlds and take particular notice of Earth, after seeing satellite broadcasts of TV shows of a powerful panda, Pandy."
    },
    
    {   
        "name":"Blue call(360p)",
        "logo":"https://m.media-amazon.com/images/M/MV5BZjk4NzlhMjYtMjhlZi00MjIzLWFkZjAtMzBhMWZhNjZhNDExXkEyXkFqcGdeQXVyMjIxODA2MTA@._V1_FMjpg_UY682_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"English",
        "description":"Haylee, a local EMT suffering from PTSD, spends her days making split second decisions with lives that hang in the balance. One night on a routine call, she is faced with a moral decision, taking matters into her own hands and mercy kills a young woman. Her decision opens a pandora's box that leads Haylee to blur the lines of her job responsibilities and wanting to help those in need. Now, falling deeper and deeper into a rabbit hole, she gets caught up in a world of underground drugs and a sadistic killer who's made her his next victim."
    },
    {   
        "name":"Godzilla vs Kong(Hindi audio)",
        "logo":"https://images-na.ssl-images-amazon.com/images/I/81SAqNnNlfL._AC_SL1500_.jpg",
        "type":"m38u",
        "url":"https://llvod.mxplay.com/video/4fffa9037b466b90e5cf0022f0fb7ebc/6/hls/h264_baseline.m3u8",
        "language":"Hindi",
        "description":"Godzilla vs. Kong is a 2021 American monster film directed by Adam Wingard. A sequel to Godzilla: King of the Monsters (2019) and Kong: Skull Island (2017), it is the fourth film in Legendary's MonsterVerse. It is also the 36th film in the Godzilla franchise, the 12th film in the King Kong franchise, and the fourth Godzilla film to be completely produced by a Hollywood studio. The film stars Alexander Skarsgård, Millie Bobby Brown, Rebecca Hall, Brian Tyree Henry, Shun Oguri, Eiza González, Julian Dennison, Lance Reddick, Kyle Chandler, and Demián Bichir. In the film, Kong clashes with Godzilla as humans lure the ape into the Hollow Earth to retrieve a power source for a weapon to stop Godzilla's mysterious rampages."
    }, 
] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_trendingList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;