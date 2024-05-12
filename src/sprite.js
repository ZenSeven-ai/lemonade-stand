// Class of creating the sprites from the images

import { vector } from "./vector.js";

export class sprite {
    constructor({
        resource, // image to draw
        frameSize, // size of crop
        hFrames, // horizontal arrangement
        vFrames, //vertical arrangement
        frame, // what frame you want
        scale,
        position,


    }) {
        this.resource = resource;
        this.frameSize = frameSize ?? new vector(16,16);
        this.hFrames =  hFrames ?? 1;
        this.vFrames = vFrames ?? 1;
        this.frame = frame ?? 0;
        this.scale = scale ?? 1;
        this.position = position ?? new vector(0,0);

        this.frameMap = new Map(); // where we store the frames
        this.buildFrameMap()


    }


    // Makes the map of frames for the sprites
    buildFrameMap(){
        let framecount = 0
        for (let v = 0; v< this.vFrames; v++){
            for(let h = 0; h< this.hFrames; h++){
                framecount++;
                this.frameMap.set(
                    framecount,
                    new vector(this.frameSize.x * h, this.frameSize.y * v)
                )

            }

        }
    
        
    }
    drawImage(ctx, x, y){
        if(!this.resource.isLoaded){
            return;
        }

        let frameCoordx = 0;
        let frameCoordy = 0;

        const frame = this.frameMap.get(this.frame);

        if(frame){
            frameCoordx = frame.x;
            frameCoordy = frame.y;
        }

        const frameSizex = this.frameSize.x;
        const frameSizey = this.frameSize.y;

        ctx.drawImage(
            this.resource.image,          
            frameCoordx,
            frameCoordy,                    
            frameSizex,
            frameSizey,
            x,
            y,
            frameSizex * this.scale,
            frameSizey * this.scale


        )


    }
}