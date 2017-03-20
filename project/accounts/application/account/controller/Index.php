<?php
/**
* 业务相关
*/

namespace app\account\controller;
use think\Db;
use think\Request;
use think\Session;

class Index extends \think\Controller
{
	
	public function __construct(){
		
		parent::__construct();
		$user_info = Session::get('user_info');
		if(empty($user_info) || intval($user_info['id']) == 0){
			$this->redirect('login/index/index');
		}
		$GLOBALS['user_info'] = $user_info;
	}
	
	/**
	* 当日记录
	*/
    public function index()
    {
		$map['is_delete'] = 0;
		$map['create_time'] = ['>',strtotime(date('Y-m-d',time()))];
		$list = db('record')->field("*")->where($map)->select();
		
		$this->assign("list", $list);
		
		$this->assign("title", '明细');
        return $this->fetch('index');
    }
	
	/**
	* 添加记录页面
	*/
	public function add(){
		
		$this->assign("title", '记账');
        return $this->fetch('add');
	}
	
	/**
	* 处理添加，数据入库
	*/
	public function doAdd(){
		
		$request = request();
		// 获取当前请求的所有变量（经过过滤）
		$input = $request->param();
		if(empty($input['money']) || $input['money'] <= 0){
			$this->error('请输入金额');
		}
		$data['user_id'] = $GLOBALS['user_info']['id'];
		$data['order_type'] = $input['order_type'];
		$data['payment_id'] = $input['payment_id'];
		$data['tid'] = $input['tid'];
		$data['money'] = $input['money'];
		$data['remark'] = $input['remark'];
		$data['create_time'] = time();
		$res = db('record')->insert($data);
		if($res){
			//跳转
			$this->success('登录成功', url('account/index/index',''));
		}
		
	}
	
	/**
	* 报表
	*/
	public function recordList(){
		
	}
}
