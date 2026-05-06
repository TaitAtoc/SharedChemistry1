{{ if ($this->registry->action === 'step1') { $progressbar_percentage = 25; $progressbar_step = 1; $progressbar_total_steps = 4; } elseif ($this->registry->action === 'step2') { $progressbar_percentage = 50; $progressbar_step = 2; $progressbar_total_steps = 4; } elseif ($this->registry->action === 'step3') { $progressbar_percentage = 75; $progressbar_step = 3; $progressbar_total_steps = 4; } elseif ($this->registry->action === 'step4') { $progressbar_percentage = 100; $progressbar_step = 4; $progressbar_total_steps = 4; } }}

<style>
    .sharedchemistry-progress {
        height: 34px;
        margin: 0 0 8px;
        background: #252730;
        border: 1px solid rgba(255, 255, 255, .08);
        border-radius: 999px;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, .35);
        overflow: hidden;
    }

    .sharedchemistry-progress .progress-bar {
        min-width: 92px;
        color: #fff;
        font-weight: 700;
        line-height: 34px;
        text-shadow: 0 1px 1px rgba(0, 0, 0, .35);
        border-radius: 999px;
    }
</style>

<div class="progress sharedchemistry-progress">
    <div
        class="progress-bar progress-bar-striped active"
        role="progressbar"
        aria-valuenow="{progressbar_percentage}"
        aria-valuemin="0"
        aria-valuemax="100"
        style="width:{progressbar_percentage}%;background-color:#e43f5f;background-image:linear-gradient(45deg,rgba(255,255,255,.18) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.18) 50%,rgba(255,255,255,.18) 75%,transparent 75%,transparent),linear-gradient(90deg,#d93052 0%,#e43f5f 52%,#ff6f8d 100%);"
    >{progressbar_percentage}% - {lang 'STEP'} {progressbar_step}/{progressbar_total_steps}
    </div>
</div>
