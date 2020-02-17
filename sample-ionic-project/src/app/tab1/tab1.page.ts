import { Component, OnInit } from '@angular/core';
import { CapacitorHelloToastService } from '../shared/services/plugins/capacitor-hello-toast.service';
import { Plugins } from '@capacitor/core';
const { HelloToastPlugin } = Plugins;

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page implements OnInit {

  constructor(private capacitorHelloToastService: CapacitorHelloToastService) { }

  ngOnInit() {
  }

  onBtnClick(name: string) {
    this.capacitorHelloToastService.showToast(name);
  }

}
