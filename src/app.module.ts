import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { FeaturesModule } from './features/features.module';
import { CoreModule } from './core/core.module';
import { CommonModule } from './common/common.module';

@Module({
  imports: [FeaturesModule, CoreModule, CommonModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
