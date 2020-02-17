import { WebPlugin } from '@capacitor/core';
import { HelloToastPluginPlugin } from './definitions';

export class HelloToastPluginWeb extends WebPlugin implements HelloToastPluginPlugin {
  constructor() {
    super({
      name: 'HelloToastPlugin',
      platforms: ['web']
    });
  }

  async showToast(options: { data: string }): Promise<{ msg: string }> {
    return new Promise((success, reject) => {
      // 取得資料
      const data = options.data;
      const msg = `${data} went through WebPlugin.`;
      console.log(`Say hi form web! ${msg}`);
      // 做點js的事
      window.alert(msg);
      // 回傳資料
      const returnValue = { 'msg': msg };
      // 成功
      return success(returnValue);
      // 失敗
      // reject("...");
    });
  }
}

const HelloToastPlugin = new HelloToastPluginWeb();

export { HelloToastPlugin };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(HelloToastPlugin);
