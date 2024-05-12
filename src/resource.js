class Resources {

    constructor(){
        // Download the pictures 
        this.toLoad = {
            sky: "/lemonade-sprites/background.png"

        };
    

        this.images = {};

        //Download each image
        Object.keys(this.toLoad).forEach(key => {
            const img = new Image()
            img.src = this.toLoad[key];
            this.images[key] = {
                image:img,
                isLoaded: false
            }

            // Checks if the image has been loaded
            img.onload = () => {
                this.images[key].isLoaded = true;
            }
        })
    }


    

}

// create an instance of resources to be used
export const resources = new Resources();