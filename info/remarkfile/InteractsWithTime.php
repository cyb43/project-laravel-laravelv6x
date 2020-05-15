<?php

//namespace Illuminate\Support;

use DateInterval;
use DateTimeInterface;

/**
 * ^2_3^ 时间交互(20200514)
 * Trait InteractsWithTime
 * @package Illuminate\Support
 */
trait InteractsWithTime
{
    /**
     * ^2_3^ Get the number of seconds until the given DateTime.
     *
     * @param  \DateTimeInterface|\DateInterval|int  $delay
     * @return int
     */
    protected function secondsUntil($delay)
    {
        // 延迟
        $delay = $this->parseDateInterval($delay);

        return $delay instanceof DateTimeInterface
                            ? max(0, $delay->getTimestamp() - $this->currentTime())
                            : (int) $delay;
    }

    /**
     * ^2_3^ Get the "available at" UNIX timestamp.
     *
     * @param  \DateTimeInterface|\DateInterval|int  $delay
     * @return int
     */
    protected function availableAt($delay = 0)
    {
        $delay = $this->parseDateInterval($delay);

        return $delay instanceof DateTimeInterface
                            ? $delay->getTimestamp()
                            : Carbon::now()->addRealSeconds($delay)->getTimestamp();
    }

    /**
     * ^2_3^ If the given value is an interval(间隔), convert it to a DateTime instance.
     *
     * @param  \DateTimeInterface|\DateInterval|int  $delay 延迟
     * @return \DateTimeInterface|int
     */
    protected function parseDateInterval($delay)
    {
        //// 日期间隔
        if ($delay instanceof DateInterval) {
            $delay = Carbon::now()->add($delay);
        }

        return $delay;
    }

    /**
     * ^2_3^ Get the current system time as a UNIX timestamp.
     *
     * @return int
     */
    protected function currentTime()
    {
        return Carbon::now()->getTimestamp();
    }
}
