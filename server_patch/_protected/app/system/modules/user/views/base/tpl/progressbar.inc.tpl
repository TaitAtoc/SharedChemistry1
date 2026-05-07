{{ if ($this->registry->action === 'step1') { $progressbar_percentage = 20; $progressbar_step = 1; $progressbar_total_steps = 5; } elseif ($this->registry->action === 'step2') { $progressbar_percentage = 40; $progressbar_step = 2; $progressbar_total_steps = 5; } elseif ($this->registry->action === 'step3') { $progressbar_percentage = 60; $progressbar_step = 3; $progressbar_total_steps = 5; } elseif ($this->registry->action === 'step4') { $progressbar_percentage = 80; $progressbar_step = 4; $progressbar_total_steps = 5; } }}

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

    .sharedchemistry-step-card .btn,
    .sharedchemistry-step-card button,
    .sharedchemistry-step-card input[type="submit"] {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        vertical-align: middle;
        line-height: 1.2;
        text-align: center;
    }

    .sharedchemistry-step-card .btn i,
    .sharedchemistry-step-card button i,
    .sharedchemistry-step-card .btn .fa,
    .sharedchemistry-step-card button .fa,
    .sharedchemistry-step-card .btn .glyphicon,
    .sharedchemistry-step-card button .glyphicon {
        color: #fff;
        font-size: 1em;
        line-height: 1;
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
