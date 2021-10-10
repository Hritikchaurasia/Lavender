const express = require('express');
const cors = require('cors');


const app = express();

const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJIcml0aWsiLCJuYW1lIjoiWW91d2lsbG5ldmVyZ2V0aXQiLCJpYXQiOjE1MTYyMzkwMjJ9.6PRPWzmu_or76BASRLuP59ALvgWdQ8viGM9aThRojyY';

app.use(express.json());
app.use(cors());


//India channel list router
const indianChannelList = require('./routers/indian_channel_list');
app.use('/indianChannelList',authorization ,indianChannelList);

//animeList
const animeList = require('./routers/anime_list');
app.use('/animeList',authorization ,animeList);


//home page 

//Trending List
const trendingList = require('./routers/trending');
app.use('/trendingList',authorization ,trendingList);

//Trending List
const newArrivalsList = require('./routers/new_arrivals');
app.use('/newarrivals',authorization ,newArrivalsList);

//featuredbanner
const featuredBanner = require('./routers/featuredBanner');
app.use('/featuredBanner',authorization ,featuredBanner);

//comming_soon 
const comming_soon = require('./routers/comming_soon');
app.use('/commingsoon',authorization,comming_soon);



//movie categories

//animationMovieCategory
const AnimatedMovies = require('./routers/Animated_movies');
app.use('/animatedMovies',authorization,AnimatedMovies);

//horror movies category
const horrorMovies = require('./routers/horror_movies');
app.use('/horrorMovies',authorization,horrorMovies);

//action movies category
const actionMovies = require('./routers/action_movie');
app.use('/actionMovies',authorization,actionMovies);


//series

//animated series
const animatedSeries = require('./routers/animated_series');
app.use('/animatedSeries',authorization,animatedSeries);

//horror series
const horrorSeries = require('./routers/horror_series');
app.use('/horrorSeries',authorization,horrorSeries);

//action series
const actionSeries = require('./routers/action_series');
app.use('/actionSeries',authorization,actionSeries);


//starting route
app.get('/', authorization ,(req,res) => {
    if(req.Auth){
        res.send("Server Connected");
    }else{
        res.send('Auth fail');
    }
 
});



//authorization
function authorization(req,res,next){
 
    const authHeader = req.headers['authorization'];
    const reqtoken = authHeader && authHeader.split(' ')[1];
    if (reqtoken == null){
 
        req.Auth = false;
    }
    if(reqtoken === token){
      
        req.Auth =  true;
   
    }else{
        req.Auth = false;
                
    }
    next();
}



const startServer = async () => {
    try {
        const PORT = process.env.PORT || 3000;
        app.listen(PORT, () => {
            console.log(`Server started `);
        });
    } catch (error) {
        console.log(error);
    }
}


startServer();

