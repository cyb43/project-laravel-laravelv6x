<?php

namespace App\Observers;

use App\User;
use Illuminate\Support\Facades\Log;


/**
 * 模型事件观察者
 * Class UserObserver
 * @package App\Observers
 * @author ^2_3^王尔贝
 */
class UserObserver
{
    /**
     * Handle the user "created" event.
     *
     * @param  \App\User  $user
     * @return void
     */
    public function created(User $user)
    {
        Log::info('模型事件观察者：created事件；');
    }

    /**
     * Handle the user "updated" event.
     *
     * @param  \App\User  $user
     * @return void
     */
    public function updated(User $user)
    {
        Log::info('模型事件观察者：updated事件；');
    }

    /**
     * Handle the user "deleted" event.
     *
     * @param  \App\User  $user
     * @return void
     */
    public function deleted(User $user)
    {
        Log::info('模型事件观察者：deleted事件；');
    }

    /**
     * Handle the user "restored" event.
     *
     * @param  \App\User  $user
     * @return void
     */
    public function restored(User $user)
    {
        Log::info('模型事件观察者：restored事件；');
    }

    /**
     * Handle the user "force deleted" event.
     *
     * @param  \App\User  $user
     * @return void
     */
    public function forceDeleted(User $user)
    {
        Log::info('模型事件观察者：forceDeleted事件；');
    }
}
