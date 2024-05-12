import { resources } from './resource.js'


const canvas = document.querySelector("#game-canvas")
const ctx = canvas.getContext("2d")

const draw = () => {
    const sky = resources.images.sky
    if(sky.isLoaded){
        ctx.drawImage(sky.image, 0, 0) // draw on top left corner
    }

}

// draw at an interval so that we can ensure sky is loaded. 
setInterval(() => {
    console.log("here")
    draw()

}, 300)