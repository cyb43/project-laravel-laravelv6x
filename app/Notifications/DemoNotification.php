<?php

namespace App\Notifications;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;


/**
 * 通知类(队列化)
 * Class DemoNotification
 * @package App\Notifications
 * @author ^2_3^王尔贝
 */
class DemoNotification extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * @var User
     * @author ^2_3^王尔贝
     */
    public $user;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * 获取通知发送频道
     * 决定通知会在哪个频道上发送。开箱即用的频道有 mail(邮件)，database(数据库)，broadcast(广播，允许 JavaScript 客户端实时捕获通知)，nexmo，和 slack。
     * Get the notification's delivery(交付) channels.
     *
     * @param  mixed  $notifiable 通知实际发送到的类的实例;
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    /**
     * 邮件mail通知频道
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * 数据库通知频道
     * @param $notifiable
     * @return array
     * @author ^2_3^王尔贝
     */
    public function toDatabase($notifiable)
    {
        return $this->user->toArray();
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
