const express = require('express');
const router = express.Router();

const resJson_IndianChannelList = [
    {
      "name": "&Flix",
      "logo": "https://static.epg.best/in/AndFlix.in.png",
      "type":"m38u",
      "url": "https://y5w8j4a9.ssl.hwcdn.net/andflixhd/tracks-v1a1/index.m3u8",
      "category": "Movies"
    },
    {
      "name": "&privé HD",
      "logo": "https://upload.wikimedia.org/wikipedia/en/4/4f/Logo_of_%26_Priv%C3%A9_HD.jpg",
        "type":"m38u",
      "url": "https://y5w8j4a9.ssl.hwcdn.net/andprivehd/tracks-v1a1/index.m3u8",
      "category": "Movies"
    },
    {
       "name": "3 Tamil TV",
      "logo": "https://i.imgur.com/WfAU7pB.png",
        "type":"m38u",
      "url": "https://6n3yogbnd9ok-hls-live.5centscdn.com/threetamil/d0dbe915091d400bd8ee7f27f0791303.sdp/index.m3u8",
      "category": "Entertainment"
    },
  
    {
       "name": "7X Music",
      "logo": "https://i.imgur.com/fD7wLka.jpg",
        "type":"m38u",
      "url": "http://newsjatt.camdvr.org:1935/newsjatt/myStream/playlist.m3u8",
      "category": "Music"
    },
     {
       "name": "9XM",
      "logo": "https://i.imgur.com/fD7wLka.jpg",
        "type":"m38u",
      "url": "https://d2q8p4pe5spbak.cloudfront.net/bpk-tv/9XM/9XM.isml/index.m3u8",
      "category": "Music"
    },
     
     {
       "name": "Aaj Tak",
      "logo": "https://upload.wikimedia.org/wikipedia/commons/a/ab/AT-New-Logo-800x600.png",
        "type":"m38u",
      "url": "https://feeds.intoday.in/aajtak/api/aajtakhd/master.m3u8",
      "category": "News"
    },
     {
       "name": "Aaj Tak (560p)",
      "logo": "https://upload.wikimedia.org/wikipedia/commons/a/ab/AT-New-Logo-800x600.png",
        "type":"m38u",
      "url": "https://lmil.live-s.cdn.bitgravity.com/cdn-live/_definst_/lmil/live/aajtak_app.smil/playlist.m3u8",
      "category": "News"
    },
    {
      "name": "Aathavan TV",
      "logo": "https://i.imgur.com/IgwQ7o5.png",
      "type":"m38u",
  "language":"Tamil",
      "url": "http://45.77.66.224:1935/athavantv/live/playlist.m3u8",
      "category": "Entertainment"
    },
  
  {
      "name": "ABP Ananda",
      "logo": "https://tv.releasemyad.com/images/logo/20160108044853abp-ananada.jpg",
      "type":"m38u",
  "language":"Hindi",
      "url": "https://abp-i.akamaihd.net/hls/live/765530/abpananda/master.m3u8",
      "category": "News"
    },
  
  {
      "name": "ABP Ananda(720p)",
      "logo": "https://tv.releasemyad.com/images/logo/20160108044853abp-ananada.jpg",
      "type":"m38u",
      "url": "https://d3pnfn2zxtq6km.cloudfront.net/out/v1/c77a35d9d4f74371a3cf0f214a9eb8c0/index.m3u8",
      "category": "News"
    },
  
  
  {
      "name": "ABP Asmita(324p)",
      "logo": "https://upload.wikimedia.org/wikipedia/en/4/42/ABP_Asmita_Logo.png",
      "type":"m38u",
      "language":"Gujrati",
      "url": "http://abpasmita-lh.akamaihd.net:80/i/abpasmita_1@77821/master.m3u8",
      "category": "News"
    },
  
  
  
  
  {
      "name": "ABP Asmita(720p)",
      "logo": "https://upload.wikimedia.org/wikipedia/en/4/42/ABP_Asmita_Logo.png",
      "type":"m38u",
    "language":"Gujrati",
      "url": "https://abp-i.akamaihd.net/hls/live/765532/abpasmita/master.m3u8",
      "category": "News"
    },	
  
  
  {
      "name": "ABP Asmita",
      "logo": "https://upload.wikimedia.org/wikipedia/en/4/42/ABP_Asmita_Logo.png",
      "type":"m38u",
      "language":"Gujrati",
      "url": "https://abpasmita-lh.akamaihd.net/i/abpasmita_1@77821/master.m3u8",
      "category": "News"
    },
  
  {
      "name": "ABP News(324p)",
      "logo": "https://static.abplive.in/wp-content/themes/abp-hindi/images/logo/hindiLogoD.png",
      "type":"m38u",
  "language":"English",
      "url": "http://hindiabp-lh.akamaihd.net/i/hindiabp1new_1@192103/master.m3u8",
      "category": "News"
    },
    
  
  
  
  
  {
      "name": "ABP Majha",
      "logo": "https://upload.wikimedia.org/wikipedia/en/5/5a/ABP_Majha_Logo.png",
      "type":"m38u",
      "language":"Hindi",
      "url": "https://abp-i.akamaihd.net/hls/live/765531/abpmajha/master.m3u8",
      "category": "News"
    },
  
  
  
  {
      "name": "ABP News(720p)",
      "logo": "https://static.abplive.in/wp-content/themes/abp-hindi/images/logo/hindiLogoD.png",
      "type":"m38u",
    "language":"English",
      "url": "https://abp-i.akamaihd.net/hls/live/765529/abphindi/master.m3u8",
      "category": "News"
    },
  
  ] ;



router.get('/', async (req,res) => {
    if(req.Auth){
      try {
        res.status('200').send(resJson_IndianChannelList);
    } catch (error) {
        res.status('500').send('Server error');
    }

    }
    else{
      res.status('400').send('Auth fail');
    }
   
    
});


module.exports  = router;