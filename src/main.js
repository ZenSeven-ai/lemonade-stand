import { resources } from './resource.js'
import { sprite } from './sprite.js'
import { vector } from './vector.js'


const canvas = document.querySelector("#game-canvas")
const ctx = canvas.getContext("2d")

const sky = new sprite({
    resource: resources.images.sky,
    frameSize: new vector(320,180)
    
})

const background = new sprite({
    resource: resources.images.background,
    frameSize: new vector(320,180)
    
})


const girl = new sprite({
    resource: resources.images.girl,
    frameSize: new vector(32, 32),
    hFrames: 3,
    vFrames: 8,
    frame: 2,
})

const girlPos = new vector(16*5, 16*5);

const draw = () => {
    sky.drawImage(ctx, 0, 0)
    background.drawImage(ctx, 64, 16)
    girl.drawImage(ctx, girlPos.x, girlPos.y)


}



// draw at an interval so that we can ensure sky is loaded. 
setInterval(() => {
    console.log("here")
    draw()

}, 300)