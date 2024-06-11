// Index.ets
// 导入页面路由模块
import router from '@ohos.router';

@Entry
@Component

struct Index {
  @State message: string = '4388小游戏'
  @State cc:Array<Resource>=[$r('app.media.zybj'),$r('app.media.ind1'),$r('app.media.ind2')]

  build() {
    Row() {
      Image($r('app.media.ind'))
        .width(350)
        .height(150)
        .position({ x: 40, y: 160 })
      Column() {

        // 添加按钮，以响应用户点击
        Button("开心消消乐")
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
          .opacity(0.9)
        .backgroundColor('#0D9FFB')
        .width('50%')
        .height('6%')
          .fontSize(20)
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 跳转到第二页
          router.pushUrl({ url: 'pages/xxl' }).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })
        Button("俄罗斯方块")
        .type(ButtonType.Capsule)
          .fontSize(20)
        .margin({
          top: 20
        })
          .opacity(0.9)
        .backgroundColor('#0D9FFB')
        .width('50%')
        .height('6%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 跳转到第二页
          router.pushUrl({ url: 'pages/els' }).then(() => {
            console.info('Succeeded in jumping to the second page.')
          }).catch((err) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })
        Button("井字棋")
          .fontSize(20)
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .opacity(0.9)
          .backgroundColor('#0D9FFB')
          .width('50%')
          .height('6%')
            // 跳转按钮绑定onClick事件，点击时跳转到第二页
          .onClick(() => {
            console.info(`Succeeded in clicking the 'Next' button.`)
            // 跳转到第二页
            router.pushUrl({ url: 'pages/jzq' }).then(() => {
              console.info('Succeeded in jumping to the second page.')
            }).catch((err) => {
              console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
            })
          })
      }
      .width('100%')
    }
    .backgroundImage(this.cc[Math.floor(Math.random() * 3)])
    .backgroundImageSize({ width: '100%', height: '100%' })
    .height('100%')
  }
}