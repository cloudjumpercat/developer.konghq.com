class EntityExampleComponent {
  constructor(elem) {
    this.elem = elem;
    this.select = this.elem.querySelector('.tab-select-tool');

    this.addEventListeners();
    this.select.dispatchEvent(new Event('change'));
  }

  addEventListeners() {
    this.select.addEventListener('change', this.selectTab.bind(this));
  }

  selectTab(event) {
    event.stopPropagation();
    const selectedTab = event.currentTarget;

    this.hideTabs(selectedTab);

    const panelId = selectedTab.value;
    const selectedPanel = this.elem.querySelector(`.tab-content[id="${panelId}"]`);

    selectedPanel.classList.remove('hidden');
  }

  hideTabs(selectedTab) {
    selectedTab
      .closest('.entity-example')
      .querySelectorAll(':scope > .tab-content')
      .forEach((item) => {
        item.classList.add('hidden');
      });
  }
}

export default class EntityExample {
  constructor() {
    document.querySelectorAll('.entity-example').forEach((elem) => {
      new EntityExampleComponent(elem);
    });
  }
}
