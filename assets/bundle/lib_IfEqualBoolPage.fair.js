GLOBAL['#FairKey#']=(function(__initProps__){const __global__=this;return runCallback(function(__mod__){with(__mod__.imports){function _IfEqualBoolPageState(){const inner=_IfEqualBoolPageState.__inner__;if(this==__global__){return new _IfEqualBoolPageState({__args__:arguments});}else{const args=arguments.length>0?arguments[0].__args__||arguments:[];inner.apply(this,args);_IfEqualBoolPageState.prototype.ctor.apply(this,args);return this;}}_IfEqualBoolPageState.__inner__=function inner(){this.fairProps=__initProps__;this._title=null;this._count=null;};_IfEqualBoolPageState.prototype={onLoad:function onLoad(){const __thiz__=this;with(__thiz__){_title=fairProps.__op_idx__('pageName');_count=fairProps.__op_idx__('count');}},onTapText:function onTapText(){const __thiz__=this;with(__thiz__){_count=_count+1;setState('#FairKey#',function dummy(){});}},_countCanMod2:function _countCanMod2(){const __thiz__=this;with(__thiz__){return _count%2==1;}},initState:function initState(){const __thiz__=this;with(__thiz__){fairProps=widget.fairProps;onLoad();}},};_IfEqualBoolPageState.prototype.ctor=function(){Object.prototype.ctor.call(this);};;return _IfEqualBoolPageState();}},[]);})(convertObjectLiteralToSetOrMap(JSON.parse('#FairProps#')));