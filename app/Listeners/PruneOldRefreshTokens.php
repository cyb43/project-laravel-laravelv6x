<?php

namespace App\Listeners;

use Laravel\Passport\Events\RefreshTokenCreated;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;


/**
 * ^2_3^ 删除多余刷新令牌
 * Class PruneOldRefreshTokens
 * @package App\Listeners
 */
class PruneOldRefreshTokens
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  RefreshTokenCreated  $event
     * @return void
     */
    public function handle(RefreshTokenCreated $event)
    {
        $refreshTokenId = $event->refreshTokenId;
        $accessTokenId = $event->accessTokenId;

//        $info = "RefreshTokenCreated \$refreshTokenId='{$refreshTokenId}', \$accessTokenId='{$accessTokenId}'";
//        Log::info( $info );

        // 提示：已经在RevokeOldTokens删除多余访问令牌时关联删除多余刷新令牌；
    }
}
