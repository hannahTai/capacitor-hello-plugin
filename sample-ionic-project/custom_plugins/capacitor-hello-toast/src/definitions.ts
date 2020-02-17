declare module "@capacitor/core" {
  interface PluginRegistry {
    HelloToastPlugin: HelloToastPluginPlugin;
  }
}

export interface HelloToastPluginPlugin {
  showToast(options: { data: string }): Promise<{msg: string}>;
}
