define("pages/open-course/verification/views/verification",["require","exports","module","bundles/phoenix/lib/view","bundles/verification/viewModels/verificationModule","bundles/verification/views/verificationModule","pages/open-course/verification/views/verification.html"],function(require,exports,module){"use strict";var e=require("bundles/phoenix/lib/view"),t=require("bundles/verification/viewModels/verificationModule"),i=require("bundles/verification/views/verificationModule"),n=require("pages/open-course/verification/views/verification.html"),o=e.extend({template:n,name:"body",initialize:function initialize(i){var e=this;this.onStateChange=i.onStateChange,this.verificationViewModel=new t({verificationDisplay:i.verificationDisplay,metadata:i.itemMetadata,canOptOut:!0}),this.listenTo(this.verificationViewModel,"verificationComplete",function(){e.onStateChange("attempt",{verifiableId:e.verificationViewModel.get("verifiableId")})})},postRender:function postRender(){this.region.append(i,{to:this.$$("verification-container"),initialize:{verificationViewModel:this.verificationViewModel},module:i})}});module.exports=o});