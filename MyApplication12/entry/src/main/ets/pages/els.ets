import http from '@ohos.net.http';
import router from '@ohos.router';
import curves from '@ohos.curves';
@Entry
@Component
struct Index {
  @State ansz:number=1
  @State bz:Resource=$r('app.media.bz')
  @State bzq:Resource=$r('app.media.bxq')
  @State nd:number=1000
  @State fkztm:number=0
  @State fkzt:number=0
  @State pd:number=1
  @State elsfk:Array<number>=[]
  @State ksan:Visibility=Visibility.Visible
  @State nihao:Visibility=Visibility.Hidden
  @State translateX: number = 0;
  @State fs:number=0
  @State selectedImageId: number = -1;
  @State fk:Array<Resource>=[$r('app.media.feng'),$r('app.media.huang'),$r('app.media.lan'),$r('app.media.hong')]
  @State bj:Resource=$r('app.media.bj')
  @State xy:Resource=$r('app.media.xyk')
  @State an111:Resource=$r('app.media.zhuo')
  @State an222:Resource=$r('app.media.you')
  @State an333:Resource=$r('app.media.z')
  @State an444:Resource=$r('app.media.x')
  @State an1:Resource=$r('app.media.zhuo')
  @State an2:Resource=$r('app.media.you')
  @State an3:Resource=$r('app.media.z')
  @State an4:Resource=$r('app.media.x')
  @State an11:Resource=$r('app.media.zhuo1')
  @State an22:Resource=$r('app.media.you1')
  @State an33:Resource=$r('app.media.z1')
  @State an44:Resource=$r('app.media.x1')
  jis:Array<number>=[0,0,0,0,0,0,0,0,0,0,0,0]
  @State xyk:Array<Array<Resource>>=new Array(4).fill(null).map(() => {
  return new Array(3).fill(null).map(() => {
     return this.xy
});
});
  @State on:Array<Array<Resource>>=new Array(20).fill(null).map(() => {
    return new Array(10).fill(null).map(() => {
      return this.bj
    });
  });
  build() {
    Row() {
      Column() {
        Select([{ value: '难度：简单', icon: $r('app.media.6') },
          { value: '难度：中等', icon: $r('app.media.6') },
          { value: '难度：困难', icon: $r('app.media.6') },
          { value: '难度：地狱', icon: $r('app.media.6') }])
          .selected(2)
          .value('请选择难度')
          .font({ size: 20, weight: 500 })
          .fontColor('#ff000000')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .visibility(this.ksan)
          .onSelect((index: number) => {
            console.info('Select:' + index)
            switch (index){
              case 0:
                this.nd=1000
              break;
              case 1:
                this.nd=800
                break;
              case 2:
                this.nd=500
                break;
              case 3:
                this.nd=300
                break;
            }
            console.log("难度"+this.nd)
          })
          .position({x:83,y:300})
          .zIndex(1000)
        Text("您获取了\n"+this.fs+"\n分")
          .width(200)
          .height(150)
          .position({x:50,y:150})
          .visibility(this.nihao)
          .zIndex(1000)
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor('#ffffffff')
        Button("点我开启下一把游戏", { type: ButtonType.Capsule, stateEffect: true })
          .fontSize(20)
          .height(100)
          .width(250)
          .onClick(()=>this.xyj())
          .visibility(this.nihao)
          .position({x:20,y:350})
          .zIndex(1000)
        Button("开始游戏")
          .height(50)
          .width(100)
          .onClick(()=>this.ks())
          .visibility(this.ksan)
          .position({x:100,y:200})
          .zIndex(100)
        ForEach(this.on, (row, rowIndex) => {
          Row() {
            ForEach(row, (image, colIndex) => {
              Flex({
                direction: FlexDirection.Column,
                alignItems: ItemAlign.Center,
                justifyContent: FlexAlign.Center
              }) {
                Image(this.on[rowIndex][colIndex])
                  .width(30)
                  .height(30)
                  .borderWidth(1)
                  .borderColor(Color.Black)
                  .opacity(this.isHighlight(rowIndex * 10 + colIndex) ? 1 : 1)
                  .onClick(() => this.onImageClick(rowIndex, colIndex))

              }
              .width(30)
              .height(30)
            })

          }
          .margin({ top: 0, right: 0 })
        })
        Row() {
          Image(this.an1)
            .width(70)
            .height(70)
            .objectFit(ImageFit.Contain)
            .margin({top:10,right:10})
             .onTouch((event: TouchEvent) => {
               if (event.type === TouchType.Down) {
                 if(this.ksan==Visibility.Hidden) {
                   this.zhuo()
                 }
                 console.log("===按下")
                 this.an1=this.an11
               }
               if (event.type === TouchType.Up) {
                 console.log("===弹起")
                 this.an1=this.an111
               }
             })
          Image(this.an2)
            .width(70)
            .height(70)
            .objectFit(ImageFit.Contain)
            .margin({top:10,right:10})
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                 if(this.ksan==Visibility.Hidden) {
                   this.you()
                 }
                console.log("===按下")
                this.an2=this.an22
              }
              if (event.type === TouchType.Up) {
                console.log("===弹起")
                this.an2=this.an222
              }
            })
          Image(this.an3)
            .width(70)
            .height(70)
            .objectFit(ImageFit.Contain)
            .margin({top:10,right:20})
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                 if(this.ksan==Visibility.Hidden) {
                   this.z()
                 }
                console.log("===按下")
                this.an3=this.an33
              }
              if (event.type === TouchType.Up) {
                console.log("===弹起")
                this.an3=this.an333
              }
            })
          Image(this.an4)
            .width(70)
            .height(70)
            .objectFit(ImageFit.Contain)
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                 if(this.ksan==Visibility.Hidden) {
                   this.x()
                 }
                console.log("===按下")
                this.an4=this.an44
              }
              if (event.type === TouchType.Up) {
                console.log("===弹起")
                this.an4=this.an444
              }
            })
        }
        .width(400)
        .margin({left:100})
      }
      .width('70%')
      .height('100%')
      .margin({ top: 30, left: 0 })
       Column() {
         Text("下一块")
           .fontSize(30)
           .width('80%')
           .margin({ top: 30, left: 16 })
         ForEach(this.xyk, (row, rowIndex) => {
           Row() {
             ForEach(row, (image, colIndex) => {
               Flex({
                 direction: FlexDirection.Column,
                 alignItems: ItemAlign.Center,
                 justifyContent: FlexAlign.Center
               }) {
                 Image(this.xyk[rowIndex][colIndex])
                   .width(30)
                   .height(30)
                   .borderWidth(1)
                   .borderColor(Color.Black)
                   .opacity(this.isHighlight(rowIndex * 10 + colIndex) ? 1 : 1)
                   .onClick(() => this.onImageClick(1, 1))
               }
               .width(30)
               .height(30)
             })

           }
           .margin({ top: 0, right: 0,left:10 })
         })
         Text("分数")
           .fontSize(30)
           .width('80%')
           .margin({ top: 35, left: 40 })
         Text(""+this.fs)
           .fontSize(30)
           .width('80%')
           .margin({ top: 30, left: 45 })
       }
      .width("30%")
      .height('100%')
    }
    .backgroundImage($r('app.media.q'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
xyj(){
  this.nihao=Visibility.Hidden
  for(let i=0;i<20;i++){
    for(let j=0;j<10;j++){
      this.on[i][j]=this.bj
    }
  }
  this.ksan=Visibility.Visible
}
   ks(){
     this.ksan=Visibility.Hidden
     this.fs=0
      let that=this
     var xykxz= Math.floor(Math.random() * 4)
     var xykys=Math.floor(Math.random() * 7)
     var xy1=1
    that.pd=1;
     let intervalID = setInterval(function() {
       console.log("运行中");
       that.onImageClick(1, 1)
       if(that.pd==1) {
         that.fkztm=0
         that.ansz=1
         that.onImageClick(1, 1)
           var ys = xykxz
           var xt = xykys
           that.fkzt=xt;
           xykxz= Math.floor(Math.random() * 4)
           xykys=Math.floor(Math.random() * 7)
         that.fkztm=0
         // clearInterval(intervalID);
         switch (xt) {
           case 0:
             if(that.on[0][5]!=that.bj ||that.on[1][5] !=that.bj || that.on[2][5]!=that.bj || that.on[3][5]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[3][5] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[3][5] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 1
               that.elsfk[3] = 5
               that.elsfk[4] = 2
               that.elsfk[5] = 5
               that.elsfk[6] = 3
               that.elsfk[7] = 5
               break;
             }
           case 1:
             if(that.on[0][5]!=that.bj ||that.on[1][5] !=that.bj || that.on[2][5]!=that.bj || that.on[2][4]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[2][4] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[2][4] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 1
               that.elsfk[3] = 5
               that.elsfk[4] = 2
               that.elsfk[5] = 5
               that.elsfk[6] = 2
               that.elsfk[7] = 4
               break;
             }
           case 2:
             if(that.on[0][5]!=that.bj ||that.on[1][5] !=that.bj || that.on[2][5]!=that.bj || that.on[2][6]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[2][6] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[2][5] = that.fk[ys]
               that.on[2][6] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 1
               that.elsfk[3] = 5
               that.elsfk[4] = 2
               that.elsfk[5] = 5
               that.elsfk[6] = 2
               that.elsfk[7] = 6
               break;
             }
           case 3:
             if(that.on[0][5]!=that.bj ||that.on[0][6] !=that.bj || that.on[1][5]!=that.bj || that.on[1][6]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[1][6] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[1][6] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 0
               that.elsfk[3] = 6
               that.elsfk[4] = 1
               that.elsfk[5] = 5
               that.elsfk[6] = 1
               that.elsfk[7] = 6
               break;
             }
           case 4:
             if(that.on[0][5]!=that.bj ||that.on[0][6] !=that.bj || that.on[1][4]!=that.bj || that.on[1][5]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[1][4] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[1][4] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 0
               that.elsfk[3] = 6
               that.elsfk[4] = 1
               that.elsfk[5] = 5
               that.elsfk[6] = 1
               that.elsfk[7] = 4
               break;
             }
           case 5:
             if(that.on[0][5]!=that.bj ||that.on[0][6] !=that.bj || that.on[0][4]!=that.bj || that.on[1][5]!=that.bj){
               clearInterval(intervalID);
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[0][4] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[0][6] = that.fk[ys]
               that.on[0][4] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 4
               that.elsfk[2] = 0
               that.elsfk[3] = 6
               that.elsfk[4] = 0
               that.elsfk[5] = 5
               that.elsfk[6] = 1
               that.elsfk[7] = 5
               break;
             }
           case 6:
              if(that.on[0][5]!=that.bj ||that.on[0][4] !=that.bj || that.on[1][5]!=that.bj || that.on[1][6]!=that.bj){
               clearInterval(intervalID);
                that.on[0][5] = that.fk[ys]
                that.on[0][4] = that.fk[ys]
                that.on[1][5] = that.fk[ys]
                that.on[1][6] = that.fk[ys]
               that.nihao=Visibility.Visible
               break;
             }
             else {
               that.on[0][5] = that.fk[ys]
               that.on[0][4] = that.fk[ys]
               that.on[1][5] = that.fk[ys]
               that.on[1][6] = that.fk[ys]
               that.elsfk[0] = 0
               that.elsfk[1] = 5
               that.elsfk[2] = 0
               that.elsfk[3] = 4
               that.elsfk[4] = 1
               that.elsfk[5] = 5
               that.elsfk[6] = 1
               that.elsfk[7] = 6
               break;
             }
         }
         //下一个
         for(let i=0;i<4;i++){
           for(let j=0;j<3;j++){
             that.xyk[i][j]=that.xy
           }
         }
         switch (xykys) {
           case 0:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             that.xyk[2][1] = that.fk[xykxz]
             that.xyk[3][1] = that.fk[xykxz]
             break;
           case 1:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             that.xyk[2][1] = that.fk[xykxz]
             that.xyk[2][0] = that.fk[xykxz]
             break;
           case 2:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             that.xyk[2][1] = that.fk[xykxz]
             that.xyk[2][2] = that.fk[xykxz]
             break;
           case 3:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[0][2] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             that.xyk[1][2] = that.fk[xykxz]
             break;
           case 4:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[0][2] = that.fk[xykxz]
             that.xyk[1][0] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             break;
           case 5:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[0][2] = that.fk[xykxz]
             that.xyk[0][0] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             break;
           case 6:
             that.xyk[0][1] = that.fk[xykxz]
             that.xyk[0][0] = that.fk[xykxz]
             that.xyk[1][1] = that.fk[xykxz]
             that.xyk[1][2] = that.fk[xykxz]
             break;

         }

         //判断是否有消除
        that.fkxc()
         that.pd=0
       }
       else{
         if(that.elsfk[0]!=19 && that.elsfk[2]!=19 &&that.elsfk[4]!=19 && that.elsfk[6]!=19)
         {
         if(((that.on[that.elsfk[0]+1][that.elsfk[1]]!=that.bj) && ((that.elsfk[0]+1!=that.elsfk[2]) ||(that.elsfk[1]!=that.elsfk[3])) && ((that.elsfk[0]+1!=that.elsfk[4]) ||(that.elsfk[1]!=that.elsfk[5])) &&((that.elsfk[0]+1!=that.elsfk[6]) ||(that.elsfk[1]!=that.elsfk[7])))||
           ((that.on[that.elsfk[2]+1][that.elsfk[3]]!=that.bj) && ((that.elsfk[2]+1!=that.elsfk[0]) ||(that.elsfk[3]!=that.elsfk[1])) && ((that.elsfk[2]+1!=that.elsfk[4]) ||(that.elsfk[3]!=that.elsfk[5])) &&((that.elsfk[2]+1!=that.elsfk[6]) ||(that.elsfk[3]!=that.elsfk[7])))||
           ((that.on[that.elsfk[4]+1][that.elsfk[5]]!=that.bj) && ((that.elsfk[4]+1!=that.elsfk[0]) ||(that.elsfk[5]!=that.elsfk[1])) && ((that.elsfk[4]+1!=that.elsfk[2]) ||(that.elsfk[5]!=that.elsfk[3])) &&((that.elsfk[4]+1!=that.elsfk[6]) ||(that.elsfk[5]!=that.elsfk[7])))||
           ((that.on[that.elsfk[6]+1][that.elsfk[7]]!=that.bj) && ((that.elsfk[6]+1!=that.elsfk[0]) ||(that.elsfk[7]!=that.elsfk[1])) && ((that.elsfk[6]+1!=that.elsfk[2]) ||(that.elsfk[7]!=that.elsfk[3])) &&((that.elsfk[6]+1!=that.elsfk[4]) ||(that.elsfk[7]!=that.elsfk[5]))))

         {
           console.log("===有东西")
           that.ansz=0
           that.pd=1
         }
         else
         {//下落代码
           that.on[that.elsfk[0]+1][that.elsfk[1]]=that.on[that.elsfk[0]][that.elsfk[1]]
           if(((that.elsfk[0] == that.elsfk[2]+1) && (that.elsfk[1]==that.elsfk[3])) || ((that.elsfk[0] == that.elsfk[4]+1) && (that.elsfk[1]==that.elsfk[5]))||((that.elsfk[0] == that.elsfk[6]+1) && (that.elsfk[1]==that.elsfk[7]))){}
           else{
             that.on[that.elsfk[0]][that.elsfk[1]]=that.bj
           }
           that.on[that.elsfk[2]+1][that.elsfk[3]]=that.on[that.elsfk[2]][that.elsfk[3]]
         if(((that.elsfk[2] == that.elsfk[0]+1) && (that.elsfk[3]==that.elsfk[1])) || ((that.elsfk[2] == that.elsfk[4]+1) && (that.elsfk[3]==that.elsfk[5]))||((that.elsfk[2] == that.elsfk[6]+1) && (that.elsfk[3]==that.elsfk[7]))){}
           else {
             that.on[that.elsfk[2]][that.elsfk[3]] = that.bj
           }
           that.on[that.elsfk[4]+1][that.elsfk[5]]=that.on[that.elsfk[4]][that.elsfk[5]]
           if(((that.elsfk[4] == that.elsfk[0]+1) && (that.elsfk[5]==that.elsfk[1])) || ((that.elsfk[4] == that.elsfk[2]+1) && (that.elsfk[5]==that.elsfk[3]))||((that.elsfk[4] == that.elsfk[6]+1) && (that.elsfk[5]==that.elsfk[7]))){}
           else {
             that.on[that.elsfk[4]][that.elsfk[5]] = that.bj
           }
           that.on[that.elsfk[6]+1][that.elsfk[7]]=that.on[that.elsfk[6]][that.elsfk[7]]
          if(((that.elsfk[6] == that.elsfk[0]+1) && (that.elsfk[7]==that.elsfk[1])) || ((that.elsfk[6] == that.elsfk[2]+1) && (that.elsfk[7]==that.elsfk[3]))||((that.elsfk[6] == that.elsfk[4]+1) && (that.elsfk[7]==that.elsfk[5]))){}
           else {
             that.on[that.elsfk[6]][that.elsfk[7]] = that.bj
           }
           that.elsfk[0]++
           that.elsfk[2]++
           that.elsfk[4]++
           that.elsfk[6]++
           console.log("===="+that.elsfk[0])
           console.log("====="+that.elsfk[2])
           console.log("======"+that.elsfk[4])
           console.log("======="+that.elsfk[5])
           that.onImageClick(1, 1)
         }
         }
         else{
           console.log("===落地")
           that.ansz=0
           that.pd=1
         }
       }
     }, this.nd);
   }
  fkxc(){
    var lo=1
    for(let p=0;p<20;p++){
      lo=1
      for(let o=0;o<10;o++){
        if(this.on[p][o]==this.bj){
          lo=0
        }
      }
      if(lo==1){
        for(let q=0;q<10;q++){
          this.on[p][q]=this.bj
          this.xc(p,q)
          this.fs+=10
        }
        this.dg()
      }
    }
  }
  dg(){//单个方块下落
    for(let i=1;i<19;i++){
      for(let j=1;j<9;j++){
        console.log("单个"+i+" "+j)
        if(this.on[i+1][j]==this.bj && this.on[i-1][j]==this.bj && this.on[i][j+1]==this.bj&& this.on[i][j-1]==this.bj &&this.on[i][j]!=this.bj){
          let k=i;
          while (this.on[k+1][j]==this.bj && k<20) {
            this.on[k+1][j]=this.on[k][j]
            this.on[k][j]=this.bj
            k++
          }

        }
      }
    }
  }
  xc(p:number,q:number){//方块消除后下落
      if(this.on[p-1][q]!=this.bj){
        this.on[p][q]=this.on[p-1][q]
        this.on[p-1][q]=this.bj
        this.xc(p-1,q)
      }
  }
  //按钮的实现
  zhuo() {
    if (this.ansz == 1) {
    if (this.elsfk[1] != 0 && this.elsfk[3] != 0 && this.elsfk[5] != 0 && this.elsfk[7] != 0) {
      if (((this.on[this.elsfk[0]][this.elsfk[1]-1] != this.bj) && ((this.elsfk[1] - 1 != this.elsfk[3]) ||(this.elsfk[0]!=this.elsfk[2])) && ((this.elsfk[1] - 1 != this.elsfk[5])||(this.elsfk[0]!=this.elsfk[4])) && ((this.elsfk[1] - 1 != this.elsfk[7])||this.elsfk[0]!=this.elsfk[6])) ||
      ((this.on[this.elsfk[2]][this.elsfk[3]-1] != this.bj) && ((this.elsfk[3] - 1 != this.elsfk[1]) ||(this.elsfk[2]!=this.elsfk[0])) && ((this.elsfk[3] - 1 != this.elsfk[5])||(this.elsfk[2]!=this.elsfk[4])) && ((this.elsfk[3] - 1 != this.elsfk[7])||this.elsfk[2]!=this.elsfk[6]))||
      ((this.on[this.elsfk[4]][this.elsfk[5]-1] != this.bj) && ((this.elsfk[5] - 1 != this.elsfk[1]) ||(this.elsfk[4]!=this.elsfk[0])) && ((this.elsfk[5] - 1 != this.elsfk[3])||(this.elsfk[4]!=this.elsfk[2])) && ((this.elsfk[5] - 1 != this.elsfk[7])||this.elsfk[4]!=this.elsfk[6])) ||
      ((this.on[this.elsfk[6]][this.elsfk[7]-1] != this.bj) && ((this.elsfk[7] - 1 != this.elsfk[1]) ||(this.elsfk[6]!=this.elsfk[0])) && ((this.elsfk[7] - 1 != this.elsfk[3])||(this.elsfk[6]!=this.elsfk[2])) && ((this.elsfk[7] - 1 != this.elsfk[5])||this.elsfk[6]!=this.elsfk[4]))) {
        console.log("===左移失败，有东西");
      }
      else {
        this.on[this.elsfk[0]][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
        if ((this.elsfk[0] == this.elsfk[2] && this.elsfk[1] == this.elsfk[3] - 1) || (this.elsfk[0] == this.elsfk[4] && this.elsfk[1] == this.elsfk[5] - 1) || (this.elsfk[0] == this.elsfk[6] && this.elsfk[1] == this.elsfk[7] - 1)) {
        }
        else {
          this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
        }

        this.on[this.elsfk[2]][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
        if ((this.elsfk[2] == this.elsfk[0] && this.elsfk[3] == this.elsfk[1] - 1) || (this.elsfk[2] == this.elsfk[4] && this.elsfk[3] == this.elsfk[5] - 1) || (this.elsfk[2] == this.elsfk[6] && this.elsfk[3] == this.elsfk[7] - 1)) {
        }
        else {
          this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
        }

        this.on[this.elsfk[4]][this.elsfk[5]-1] = this.on[this.elsfk[4]][this.elsfk[5]]
        if ((this.elsfk[4] == this.elsfk[2] && this.elsfk[5] == this.elsfk[3] - 1) || (this.elsfk[4] == this.elsfk[0] && this.elsfk[5] == this.elsfk[1] - 1) || (this.elsfk[4] == this.elsfk[6] && this.elsfk[5] == this.elsfk[7] - 1)) {
        }
        else {
          this.on[this.elsfk[4]][this.elsfk[5]] = this.bj
        }

        this.on[this.elsfk[6]][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
        if ((this.elsfk[6] == this.elsfk[2] && this.elsfk[7] == this.elsfk[3] - 1) || (this.elsfk[6] == this.elsfk[4] && this.elsfk[7] == this.elsfk[5] - 1) || (this.elsfk[6] == this.elsfk[0] && this.elsfk[7] == this.elsfk[1] - 1)) {
        }
        else {
          this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
        }
        this.onImageClick(1, 1)
        this.elsfk[1]--
        this.elsfk[3]--
        this.elsfk[5]--
        this.elsfk[7]--
      }
    }
  }
  }
  you() {
    if (this.ansz == 1) {
    if (this.elsfk[1] != 19 && this.elsfk[3] != 19 && this.elsfk[5] != 19 && this.elsfk[7] != 19) {
      if (((this.on[this.elsfk[0]][this.elsfk[1]+1] != this.bj) && ((this.elsfk[1] +1 != this.elsfk[3]) ||(this.elsfk[0]!=this.elsfk[2])) && ((this.elsfk[1] + 1 != this.elsfk[5])||(this.elsfk[0]!=this.elsfk[4])) && ((this.elsfk[1] + 1 != this.elsfk[7])||this.elsfk[0]!=this.elsfk[6])) ||
      ((this.on[this.elsfk[2]][this.elsfk[3]+1] != this.bj) && ((this.elsfk[3] + 1 != this.elsfk[1]) ||(this.elsfk[2]!=this.elsfk[0])) && ((this.elsfk[3] + 1 != this.elsfk[5])||(this.elsfk[2]!=this.elsfk[4])) && ((this.elsfk[3] + 1 != this.elsfk[7])||this.elsfk[2]!=this.elsfk[6]))||
      ((this.on[this.elsfk[4]][this.elsfk[5]+1] != this.bj) && ((this.elsfk[5] + 1 != this.elsfk[1]) ||(this.elsfk[4]!=this.elsfk[0])) && ((this.elsfk[5] + 1 != this.elsfk[3])||(this.elsfk[4]!=this.elsfk[2])) && ((this.elsfk[5] + 1 != this.elsfk[7])||this.elsfk[4]!=this.elsfk[6])) ||
      ((this.on[this.elsfk[6]][this.elsfk[7]+1] != this.bj) && ((this.elsfk[7] + 1 != this.elsfk[1]) ||(this.elsfk[6]!=this.elsfk[0])) && ((this.elsfk[7] + 1 != this.elsfk[3])||(this.elsfk[6]!=this.elsfk[2])) && ((this.elsfk[7] + 1 != this.elsfk[5])||this.elsfk[6]!=this.elsfk[4]))) {
        console.log("===右移失败，有东西");
      }
      else {
        this.on[this.elsfk[0]][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
        if ((this.elsfk[0] == this.elsfk[2] && this.elsfk[1] == this.elsfk[3] + 1) || (this.elsfk[0] == this.elsfk[4] && this.elsfk[1] == this.elsfk[5] + 1) || (this.elsfk[0] == this.elsfk[6] && this.elsfk[1] == this.elsfk[7] + 1)) {
        }
        else {
          this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
        }

        this.on[this.elsfk[2]][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
        if ((this.elsfk[2] == this.elsfk[0] && this.elsfk[3] == this.elsfk[1] + 1) || (this.elsfk[2] == this.elsfk[4] && this.elsfk[3] == this.elsfk[5] + 1) || (this.elsfk[2] == this.elsfk[6] && this.elsfk[3] == this.elsfk[7] + 1)) {
        }
        else {
          this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
        }

        this.on[this.elsfk[4]][this.elsfk[5]+1] = this.on[this.elsfk[4]][this.elsfk[5]]
        if ((this.elsfk[4] == this.elsfk[2] && this.elsfk[5] == this.elsfk[3] + 1) || (this.elsfk[4] == this.elsfk[0] && this.elsfk[5] == this.elsfk[1] + 1) || (this.elsfk[4] == this.elsfk[6] && this.elsfk[5] == this.elsfk[7] + 1)) {
        }
        else {
          this.on[this.elsfk[4]][this.elsfk[5]] = this.bj
        }

        this.on[this.elsfk[6]][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
        if ((this.elsfk[6] == this.elsfk[2] && this.elsfk[7] == this.elsfk[3] + 1) || (this.elsfk[6] == this.elsfk[4] && this.elsfk[7] == this.elsfk[5] + 1) || (this.elsfk[6] == this.elsfk[0] && this.elsfk[7] == this.elsfk[1] + 1)) {
        }
        else {
          this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
        }
        this.onImageClick(1, 1)
        this.elsfk[1]++
        this.elsfk[3]++
        this.elsfk[5]++
        this.elsfk[7]++
      }
    }
  }
  }
  z(){
   console.log("====转")
    switch (this.fkzt) {
      case 0:
        console.log("===="+this.fkztm)
          switch (this.fkztm) {
            case 0:
              if(this.on[this.elsfk[0]+2][this.elsfk[1]+2]==this.bj &&this.on[this.elsfk[2]+1][this.elsfk[3]+1]==this.bj&&this.on[this.elsfk[6]-1][this.elsfk[7]-1]==this.bj) {
                this.on[this.elsfk[0]+2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
                this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
                this.on[this.elsfk[2]+1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
                this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
                this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
                this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
                this.fkztm = 1;
                this.elsfk[0] += 2
                this.elsfk[1] += 2
                this.elsfk[2] += 1
                this.elsfk[3] += 1
                this.elsfk[6] -= 1
                this.elsfk[7] -= 1
              }
              break;
            case 1:
              if(this.on[this.elsfk[0]+2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[2]+1][this.elsfk[3]-1]==this.bj&&this.on[this.elsfk[6]-1][this.elsfk[7]+1]==this.bj) {
                this.on[this.elsfk[0]+2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
                this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
                this.on[this.elsfk[2]+1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
                this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
                this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
                this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
                this.fkztm = 2;
                this.elsfk[0] += 2
                this.elsfk[1] -= 2
                this.elsfk[2] += 1
                this.elsfk[3] -= 1
                this.elsfk[6] -= 1
                this.elsfk[7] += 1
              }
            break;
            case 2:
              if( this.on[this.elsfk[0]-2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[2]-1][this.elsfk[3]-1]==this.bj&&this.on[this.elsfk[6]+1][this.elsfk[7]+1]==this.bj) {
                this.on[this.elsfk[0]-2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
                this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
                this.on[this.elsfk[2]-1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
                this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
                this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
                this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
                this.fkztm = 3;
                this.elsfk[0] -= 2
                this.elsfk[1] -= 2
                this.elsfk[2] -= 1
                this.elsfk[3] -= 1
                this.elsfk[6] += 1
                this.elsfk[7] += 1
              }
            break;
            case 3:
              if(this.on[this.elsfk[0]-2][this.elsfk[1]+2]==this.bj && this.on[this.elsfk[2]-1][this.elsfk[3]+1]==this.bj&&this.on[this.elsfk[6]+1][this.elsfk[7]-1]==this.bj) {
                this.on[this.elsfk[0]-2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
                this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
                this.on[this.elsfk[2]-1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
                this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
                this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
                this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
                this.fkztm = 0;
                this.elsfk[0] -= 2
                this.elsfk[1] += 2
                this.elsfk[2] -= 1
                this.elsfk[3] += 1
                this.elsfk[6] += 1
                this.elsfk[7] -= 1
              }
              break;
          }
          break;
      case 1:
        console.log("===="+this.fkztm)
        switch (this.fkztm) {
          case 0:
            console.log("旋转j型"+this.fkztm)
            if(this.on[this.elsfk[0]+2][this.elsfk[1]+2]==this.bj &&this.on[this.elsfk[2]+1][this.elsfk[3]+1]==this.bj) {
              this.on[this.elsfk[0]+2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              // this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 1;
              this.elsfk[0] += 2
              this.elsfk[1] += 2
              this.elsfk[2] += 1
              this.elsfk[3] += 1
              this.elsfk[6] -= 1
              this.elsfk[7] += 1
            }
            break;
          case 1:
            if(this.on[this.elsfk[0]+2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[2]+1][this.elsfk[3]-1]==this.bj) {
              this.on[this.elsfk[0]+2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              // this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 2;
              this.elsfk[0] += 2
              this.elsfk[1] -= 2
              this.elsfk[2] += 1
              this.elsfk[3] -= 1
              this.elsfk[6] += 1
              this.elsfk[7] += 1
            }
            break;
          case 2:
            if( this.on[this.elsfk[0]-2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[2]-1][this.elsfk[3]-1]==this.bj) {
              this.on[this.elsfk[0]-2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              // this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 3;
              this.elsfk[0] -= 2
              this.elsfk[1] -= 2
              this.elsfk[2] -= 1
              this.elsfk[3] -= 1
              this.elsfk[6] += 1
              this.elsfk[7] -= 1
            }
            break;
          case 3:
            if(this.on[this.elsfk[0]-2][this.elsfk[1]+2]==this.bj && this.on[this.elsfk[2]-1][this.elsfk[3]+1]==this.bj) {
              this.on[this.elsfk[0]-2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              // this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 0;
              this.elsfk[0] -= 2
              this.elsfk[1] += 2
              this.elsfk[2] -= 1
              this.elsfk[3] += 1
              this.elsfk[6] -= 1
              this.elsfk[7] -= 1
            }
            break;
        }
      break;
      case 2:
        console.log("===="+this.fkztm)
        switch (this.fkztm) {
          case 0:
            if(this.on[this.elsfk[0]+2][this.elsfk[1]+2]==this.bj &&this.on[this.elsfk[6]+1][this.elsfk[7]-1]==this.bj) {
              this.on[this.elsfk[0]+2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 1;
              this.elsfk[0] += 2
              this.elsfk[1] += 2
              this.elsfk[2] += 1
              this.elsfk[3] += 1
              this.elsfk[6] += 1
              this.elsfk[7] -= 1
            }
            break;
          case 1:
            if(this.on[this.elsfk[0]+2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[6]-1][this.elsfk[7]-1]==this.bj) {
              this.on[this.elsfk[0]+2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 2;
              this.elsfk[0] += 2
              this.elsfk[1] -= 2
              this.elsfk[2] += 1
              this.elsfk[3] -= 1
              this.elsfk[6] -= 1
              this.elsfk[7] -= 1
            }
            break;
          case 2:
            if( this.on[this.elsfk[0]-2][this.elsfk[1]-2]==this.bj &&this.on[this.elsfk[6]-1][this.elsfk[7]+1]==this.bj) {
              this.on[this.elsfk[0]-2][this.elsfk[1]-2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 3;
              this.elsfk[0] -= 2
              this.elsfk[1] -= 2
              this.elsfk[2] -= 1
              this.elsfk[3] -= 1
              this.elsfk[6] -= 1
              this.elsfk[7] += 1
            }
            break;
          case 3:
            if(this.on[this.elsfk[0]-2][this.elsfk[1]+2]==this.bj &&this.on[this.elsfk[6]+1][this.elsfk[7]+1]==this.bj) {
              this.on[this.elsfk[0]-2][this.elsfk[1]+2] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 0;
              this.elsfk[0] -= 2
              this.elsfk[1] += 2
              this.elsfk[2] -= 1
              this.elsfk[3] += 1
              this.elsfk[6] += 1
              this.elsfk[7] += 1
            }
            break;
        }
        break;
      case 3:
        break;
      case 4:
        console.log("===="+this.fkztm)
      //   that.on[0][5] = that.fk[ys]
      //   that.on[0][6] = that.fk[ys]
      //   that.on[1][4] = that.fk[ys]
      //   that.on[1][5] = that.fk[ys]
        switch (this.fkztm) {
          case 0:
            if(this.on[this.elsfk[0]+1][this.elsfk[1]+1]==this.bj&&this.on[this.elsfk[2]+2][this.elsfk[3]]==this.bj ) {
              this.on[this.elsfk[0]+1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+2][this.elsfk[3]] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 1;
              this.elsfk[0] += 1
              this.elsfk[1] += 1
              this.elsfk[2] += 2
              this.elsfk[3] += 0
              this.elsfk[6] -= 1
              this.elsfk[7] += 1
            }
            break;
          case 1:
            if(this.on[this.elsfk[0]+1][this.elsfk[1]-1]==this.bj &&this.on[this.elsfk[2]][this.elsfk[3]-2]==this.bj) {
              this.on[this.elsfk[0]+1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]][this.elsfk[3]-2] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 2;
              this.elsfk[0] += 1
              this.elsfk[1] -= 1
              this.elsfk[2] += 0
              this.elsfk[3] -= 2
              this.elsfk[6] += 1
              this.elsfk[7] += 1
            }
            break;
          case 2:
            if( this.on[this.elsfk[0]-1][this.elsfk[1]-1]==this.bj &&this.on[this.elsfk[2]-2][this.elsfk[3]]==this.bj) {
              this.on[this.elsfk[0]-1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-2][this.elsfk[3]] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 3;
              this.elsfk[0] -= 1
              this.elsfk[1] -= 1
              this.elsfk[2] -= 2
              this.elsfk[3] -= 0
              this.elsfk[6] += 1
              this.elsfk[7] -= 1
            }
            break;
          case 3:
            if(this.on[this.elsfk[0]-1][this.elsfk[1]+1]==this.bj &&this.on[this.elsfk[2]][this.elsfk[3]+2]==this.bj) {
              this.on[this.elsfk[0]-1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]][this.elsfk[3]+2] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 0;
              this.elsfk[0] -= 1
              this.elsfk[1] += 1
              this.elsfk[2] -= 0
              this.elsfk[3] += 2
              this.elsfk[6] -= 1
              this.elsfk[7] -= 1
            }
            break;
        }
        break;
      case 5:
        console.log("===="+this.fkztm)
        switch (this.fkztm) {
          case 0:
            if (this.elsfk[0] != 0) {
            if (this.on[this.elsfk[0]-1][this.elsfk[1]+1] == this.bj) {
              this.on[this.elsfk[0]-1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 1;
              this.elsfk[0] -= 1
              this.elsfk[1] += 1
              this.elsfk[2] += 1
              this.elsfk[3] -= 1
              this.elsfk[6] -= 1
              this.elsfk[7] -= 1
            }
        }
            break;
          case 1:
            if(this.on[this.elsfk[0]+1][this.elsfk[1]+1]==this.bj) {
              this.on[this.elsfk[0]+1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]-1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 2;
              this.elsfk[0] += 1
              this.elsfk[1] += 1
              this.elsfk[2] -= 1
              this.elsfk[3] -= 1
              this.elsfk[6] -= 1
              this.elsfk[7] += 1
            }
            break;
          case 2:
            if( this.on[this.elsfk[0]+1][this.elsfk[1]-1]==this.bj) {
              this.on[this.elsfk[0]+1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 3;
              this.elsfk[0] += 1
              this.elsfk[1] -= 1
              this.elsfk[2] -= 1
              this.elsfk[3] += 1
              this.elsfk[6] += 1
              this.elsfk[7] += 1
            }
            break;
          case 3:
            if(this.on[this.elsfk[0]-1][this.elsfk[1]-1]==this.bj) {
              this.on[this.elsfk[0]-1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              // this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+1][this.elsfk[3]+1] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 0;
              this.elsfk[0] -= 1
              this.elsfk[1] -= 1
              this.elsfk[2] += 1
              this.elsfk[3] += 1
              this.elsfk[6] += 1
              this.elsfk[7] -= 1
            }
            break;
        }
        break;
      case 6:
        console.log("===="+this.fkztm)
        switch (this.fkztm) {
          case 0:
            if(this.on[this.elsfk[2]][this.elsfk[3]+2]==this.bj &&this.on[this.elsfk[6]+1][this.elsfk[7]-1]==this.bj) {
              this.on[this.elsfk[0]+1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]][this.elsfk[3]+2] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 1;
              this.elsfk[0] += 1
              this.elsfk[1] += 1
              this.elsfk[2] += 0
              this.elsfk[3] += 2
              this.elsfk[6] += 1
              this.elsfk[7] -= 1
            }
            break;
          case 1:
            if(this.on[this.elsfk[2]+2][this.elsfk[3]]==this.bj &&this.on[this.elsfk[6]-1][this.elsfk[7]-1]==this.bj) {
              this.on[this.elsfk[0]+1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]+2][this.elsfk[3]] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]-1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 2;
              this.elsfk[0] += 1
              this.elsfk[1] -= 1
              this.elsfk[2] += 2
              this.elsfk[3] += 0
              this.elsfk[6] -= 1
              this.elsfk[7] -= 1
            }
            break;
          case 2:
            if(this.on[this.elsfk[2]][this.elsfk[3]-2]==this.bj&&this.on[this.elsfk[6]-1][this.elsfk[7]+1]==this.bj ) {
              this.on[this.elsfk[0]-1][this.elsfk[1]-1] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]][this.elsfk[3]-2] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]-1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 3;
              this.elsfk[0] -= 1
              this.elsfk[1] -= 1
              this.elsfk[2] += 0
              this.elsfk[3] -= 2
              this.elsfk[6] -= 1
              this.elsfk[7] += 1
            }
            break;
          case 3:
            if(this.on[this.elsfk[2]-2][this.elsfk[3]]==this.bj &&this.on[this.elsfk[6]+1][this.elsfk[7]+1]==this.bj) {
              this.on[this.elsfk[0]-1][this.elsfk[1]+1] = this.on[this.elsfk[0]][this.elsfk[1]]
              this.on[this.elsfk[0]][this.elsfk[1]] = this.bj
              this.on[this.elsfk[2]-2][this.elsfk[3]] = this.on[this.elsfk[2]][this.elsfk[3]]
              this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
              this.on[this.elsfk[6]+1][this.elsfk[7]+1] = this.on[this.elsfk[6]][this.elsfk[7]]
              // this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
              this.fkztm = 0;
              this.elsfk[0] -= 1
              this.elsfk[1] += 1
              this.elsfk[2] -= 2
              this.elsfk[3] -= 0
              this.elsfk[6] += 1
              this.elsfk[7] += 1
            }
            break;
        }
        break;
    }

  }
  x(){
    console.log("====下移");
    if(this.elsfk[0]!=19 && this.elsfk[2]!=19 &&this.elsfk[4]!=19 && this.elsfk[6]!=19)
    {
      if(((this.on[this.elsfk[0]+1][this.elsfk[1]]!=this.bj) && ((this.elsfk[0]+1!=this.elsfk[2]) ||(this.elsfk[1]!=this.elsfk[3])) && ((this.elsfk[0]+1!=this.elsfk[4]) ||(this.elsfk[1]!=this.elsfk[5])) &&((this.elsfk[0]+1!=this.elsfk[6]) ||(this.elsfk[1]!=this.elsfk[7])))||
      ((this.on[this.elsfk[2]+1][this.elsfk[3]]!=this.bj) && ((this.elsfk[2]+1!=this.elsfk[0]) ||(this.elsfk[3]!=this.elsfk[1])) && ((this.elsfk[2]+1!=this.elsfk[4]) ||(this.elsfk[3]!=this.elsfk[5])) &&((this.elsfk[2]+1!=this.elsfk[6]) ||(this.elsfk[3]!=this.elsfk[7])))||
      ((this.on[this.elsfk[4]+1][this.elsfk[5]]!=this.bj) && ((this.elsfk[4]+1!=this.elsfk[0]) ||(this.elsfk[5]!=this.elsfk[1])) && ((this.elsfk[4]+1!=this.elsfk[2]) ||(this.elsfk[5]!=this.elsfk[3])) &&((this.elsfk[4]+1!=this.elsfk[6]) ||(this.elsfk[5]!=this.elsfk[7])))||
      ((this.on[this.elsfk[6]+1][this.elsfk[7]]!=this.bj) && ((this.elsfk[6]+1!=this.elsfk[0]) ||(this.elsfk[7]!=this.elsfk[1])) && ((this.elsfk[6]+1!=this.elsfk[2]) ||(this.elsfk[7]!=this.elsfk[3])) &&((this.elsfk[6]+1!=this.elsfk[4]) ||(this.elsfk[7]!=this.elsfk[5]))))
      {
        console.log("===有东西")
        this.pd=1
        this.ansz=0
      }
      else
      {//下落代码
        this.on[this.elsfk[0]+1][this.elsfk[1]]=this.on[this.elsfk[0]][this.elsfk[1]]
        if(((this.elsfk[0] == this.elsfk[2]+1) && (this.elsfk[1]==this.elsfk[3])) || ((this.elsfk[0] == this.elsfk[4]+1) && (this.elsfk[1]==this.elsfk[5]))||((this.elsfk[0] == this.elsfk[6]+1) && (this.elsfk[1]==this.elsfk[7]))){}
        else{
          this.on[this.elsfk[0]][this.elsfk[1]]=this.bj
        }
        this.on[this.elsfk[2]+1][this.elsfk[3]]=this.on[this.elsfk[2]][this.elsfk[3]]
        if(((this.elsfk[2] == this.elsfk[0]+1) && (this.elsfk[3]==this.elsfk[1])) || ((this.elsfk[2] == this.elsfk[4]+1) && (this.elsfk[3]==this.elsfk[5]))||((this.elsfk[2] == this.elsfk[6]+1) && (this.elsfk[3]==this.elsfk[7]))){}
        else {
          this.on[this.elsfk[2]][this.elsfk[3]] = this.bj
        }
        this.on[this.elsfk[4]+1][this.elsfk[5]]=this.on[this.elsfk[4]][this.elsfk[5]]
        if(((this.elsfk[4] == this.elsfk[0]+1) && (this.elsfk[5]==this.elsfk[1])) || ((this.elsfk[4] == this.elsfk[2]+1) && (this.elsfk[5]==this.elsfk[3]))||((this.elsfk[4] == this.elsfk[6]+1) && (this.elsfk[5]==this.elsfk[7]))){}
        else {
          this.on[this.elsfk[4]][this.elsfk[5]] = this.bj
        }
        this.on[this.elsfk[6]+1][this.elsfk[7]]=this.on[this.elsfk[6]][this.elsfk[7]]
        if(((this.elsfk[6] == this.elsfk[0]+1) && (this.elsfk[7]==this.elsfk[1])) || ((this.elsfk[6] == this.elsfk[2]+1) && (this.elsfk[7]==this.elsfk[3]))||((this.elsfk[6] == this.elsfk[4]+1) && (this.elsfk[7]==this.elsfk[5]))){}
        else {
          this.on[this.elsfk[6]][this.elsfk[7]] = this.bj
        }
        this.elsfk[0]++
        this.elsfk[2]++
        this.elsfk[4]++
        this.elsfk[6]++
        console.log("===="+this.elsfk[0])
        console.log("====="+this.elsfk[2])
        console.log("======"+this.elsfk[4])
        console.log("======="+this.elsfk[5])
        this.onImageClick(1, 1)
      }
    }
    else{
      console.log("===落地")
      this.pd=1
      this.ansz=0
    }

    this.onImageClick(1, 1)
  }
  isHighlight(id: number): boolean {
    return this.selectedImageId === id;
  }
  onImageClick(row: number, col: number) {
    console.log("row="+row+" col="+col)
    const id = row * 10 + col;
    if (this.selectedImageId === -1) {
      this.selectedImageId = id;
    } else {
      this.selectedImageId = -1;

    }
  }

}
function getElementById(arg0: string) {
  throw new Error('Function not implemented.');
}
