<?php

namespace App\Console\Commands;

use App\User;
use Illuminate\Console\Command;


/**
 * ^2_3^ artisan示例命令
 * Class DemoCommand
 * @package App\Console\Commands
 * @author ^2_3^王尔贝
 */
class DemoCommand extends Command
{
    /**
     * 命令行的名称及签名。(定义命令的名称、参数和选项。)
     * The name and signature of the console command.
     *
     * 参数{param} 必须赋值;
     * 参数{param-choosable?} 可选参数;
     * 参数{param-value} 带有默认值value值;
     * 参数{param-array*} 数组参数，可按顺序传递给命令行；
     *
     * 选项{--option-bool} 不带值则为bool类型选项;
     * 选项{--option-mast=} 带有值选项;
     * 选项{--option-array=*} 数组选项，传递给命令行的每个选项值都应以选项名称为前缀。
     *
     * @var string
     */
    protected $signature = 'demo:command 
                                {param} 
                                {param-choosable?} 
                                {param-value=value} 
                                {--O|--option-bool} 
                                {--option-mast=}
                           ';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'demo:command命令描述信息';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $outStr = '^2_3^ demo:command命令执行'.PHP_EOL;

        //// 参数获取
        $param = $this->argument('param');
        $outStr .= "参数名称param，值为{$param}；".PHP_EOL;
        //
        $paramChoosable = $this->argument('param-choosable') ?? '(没有赋值)';
        $outStr .= "可选参数名称param-choosable，值为{$paramChoosable}；".PHP_EOL;
        //
        $paramValue = $this->argument('param-value');
        $outStr .= "参数名称param-value，默认值为{$paramValue}；".PHP_EOL;
        //
        /// 所有参数
        $arguments = $this->arguments();
        $argumentsStr = json_encode( $arguments );
        $outStr .= "所有参数：{$argumentsStr}；".PHP_EOL;

        //// 人机交互
        $name = $this->ask('What is your name?');
        $this->comment("姓名：{$name}".PHP_EOL);
        $pwd = $this->secret('What is the password?');
        $this->comment("密码：{$pwd}".PHP_EOL);

        //// 请求确认
        if( $this->confirm('Do you wish to continue?') ) {
            $this->comment('命令将会继续...'.PHP_EOL);

            //// 自动补全
            $sex = $this->anticipate('What is your sex?', ['male', 'female']);
            $this->comment('性别：'.$sex.PHP_EOL);

            //// 多重选择
            $friend = $this->choice('What is your friend?', ['Taylor', 'Dayle'], 0);
            $this->comment('朋友：'.$friend.PHP_EOL);

            //// 编写输出
            $this->line('line() 无色输出'.PHP_EOL);
            $this->info('info() 普通信息'.PHP_EOL);
            $this->comment('comment() 描述信息'.PHP_EOL);
            $this->question('question() 问题信息'.PHP_EOL);
            $this->error('error() 错误信息'.PHP_EOL);

            //// 表格布局
            $headers = ['Name', 'Email'];
            $users = User::all(['Name', 'Email'])->toArray();
            $this->table($headers, $users);

            //// 进度条
            $bar = $this->output->createProgressBar( count($users) );
            $bar->start();
            foreach ($users as $user) {
                sleep(2);
                $bar->advance();
            }
            $bar->finish();
            $this->line(PHP_EOL);

            $this->comment($outStr);
        }else {
            $this->comment('命令停止运行.'.PHP_EOL);
        }
    }
}
