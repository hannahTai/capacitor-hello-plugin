import { Injectable } from '@angular/core';
import { Plugins } from '@capacitor/core';
const { HelloToastPlugin } = Plugins;

@Injectable({
    providedIn: 'root'
})
export class CapacitorHelloToastService {

    constructor() { }

    showToast(name: string) {
        HelloToastPlugin.showToast({ data: name }).then(
            (value) => {
                // success
                console.log(`${value.msg} And came back!!!`);
            },
            (reason) => {
                // fail
            });
    }

}
