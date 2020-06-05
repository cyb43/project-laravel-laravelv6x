<?php

namespace App\Mail;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;


/**
 * 示例邮件发送类
 * Class DemoMail
 * @package App\Mail
 * @author ^2_3^王尔贝
 */
class DemoMail extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    /**
     * @var User
     * @author ^2_3^王尔贝
     */
    public $user;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * 创建邮件内容
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        // view() 邮件内容渲染模版;
        // text() 定义纯文本格式的邮件，text方法接收用于渲染邮件内容的模板名，既可以定义纯文本消息也可以定义HTML消息。
        // with() 传递数组数据到该方法以便数据在视图模板中生效。
        // attach() 接受文件的绝对路径作为它的第一个参数；传递数组作为第二个参数，以指定显示名称和 / 或是 MIME 类型。
        // attachFromStorage('文件存储文件', '文件附件名称', '其他选项')，"attachFromStorage('/path/to/file', 'name.pdf', ['mime' => 'application/pdf']);"。
        // attachFromStorageDisk() 指定默认磁盘以外的存储磁盘，"attachFromStorageDisk('s3', '/path/to/file');"。
        // attachData() 使用字节数据作为附件，将内存中生成而没有保存到磁盘中的 PDF 附加到邮件中。attachData 方法第一个参数接收原始字节数据，第二个参数为文件名，第三个参数接受一个数组以指定其他参数。
        // withSwiftMessage() 注册一个回调，它将在发送消息之前被调用，原始的 SwiftMailer 消息将作为该回调的参数。
        return $this->view('emails.demo');

//        $this->withSwiftMessage(function ($message) {
//            $message->getHeaders()
//                ->addTextHeader('Custom-Header', 'HeaderValue');
//        });
    }
}
