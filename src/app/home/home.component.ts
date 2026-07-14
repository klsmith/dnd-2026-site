import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

interface Event {
  name: string;
  date: Date;
}

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  events: Event[] = [
    { name: 'Session 0', date: new Date('2026-07-24T12:00:00') },
    { name: 'Session 1', date: new Date('2026-08-07T12:00:00') }
  ].sort((a, b) => a.date.getTime() - b.date.getTime());
}
